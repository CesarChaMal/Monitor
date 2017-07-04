package com.monitor.service;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.faces.bean.ManagedProperty;
import javax.imageio.ImageIO;
import org.apache.commons.io.FilenameUtils;

import com.monitor.filter.FiltrosMonitor;
import com.monitor.model.Foto;
import com.monitor.persistencia.Persistencia;

public class LoadImgService {
	private ArrayList<Foto> listFotoDescarga;
	@ManagedProperty("#{persistencia}")
	public Persistencia persistencia;


	public ByteArrayOutputStream dowload(ArrayList<Foto> listFotoDescarga) throws IOException {

		HashMap<String, Foto> mapFotos = new HashMap<>();
		this.listFotoDescarga = listFotoDescarga;

		// se quitan fotos duplicadas
		for (int i = 0; i < listFotoDescarga.size(); i++) {
			mapFotos.put(listFotoDescarga.get(i).getFotoPath(), listFotoDescarga.get(i));
		}

		Iterator<Map.Entry<String, Foto>> it = mapFotos.entrySet().iterator();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		ZipOutputStream out = new ZipOutputStream(os);
		while (it.hasNext()) {
			Map.Entry<String, Foto> pair = it.next();
			Foto foto = (Foto) pair.getValue();
			File imgFileDisk = new File(foto.getFotoPath());
			FileInputStream fileInputStream = new FileInputStream(imgFileDisk);
			BufferedImage img = ImageIO.read(fileInputStream);	
			String pathImgStr =FilenameUtils.getPath(imgFileDisk.getAbsolutePath())+FilenameUtils.getBaseName(imgFileDisk.getCanonicalPath())+"."+FilenameUtils.getExtension(imgFileDisk.getPath());
			out.putNextEntry(new ZipEntry(pathImgStr));
			ImageIO.write(img, "jpg", out);
			out.closeEntry();

		}
		out.close();
		return os;

	}
	
	public ByteArrayOutputStream dowloadPorUsuario(String cveCliPro) throws Exception{
		FotoService fotoService = new FotoService(persistencia.getEntityManager());
		FiltrosMonitor filtrosMonitor = new FiltrosMonitor();
		filtrosMonitor.setCveClipro(cveCliPro);
		listFotoDescarga = fotoService.obtenerFotosPorUsuario(filtrosMonitor);
		return dowload(listFotoDescarga);
		
	}

	public Persistencia getPersistencia() {
		return persistencia;
	}

	public void setPersistencia(Persistencia persistencia) {
		this.persistencia = persistencia;
	}


}
