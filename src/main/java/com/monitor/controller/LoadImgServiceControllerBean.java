package com.monitor.controller;

import java.awt.Graphics;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseId;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.Charsets;
import org.primefaces.context.RequestContext;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import com.monitor.model.Foto;

@ManagedBean
@RequestScoped
public class LoadImgServiceControllerBean {
	private Foto foto;

	private StreamedContent fotoMainPage;
	private StreamedContent fotoOriginal;
	private String pathFoto;

	public StreamedContent getFotoMainPage() {
		FacesContext context = FacesContext.getCurrentInstance();
		String path = context.getExternalContext().getRequestParameterMap().get("pathFoto");
		try {
			if (context.getCurrentPhaseId() == PhaseId.RENDER_RESPONSE) {
				return new DefaultStreamedContent();

			} else {
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				System.out.println("path" + path);
				if (path != null && !path.isEmpty()) {
					BufferedImage img = ImageIO.read(new FileInputStream(path));
					// image is scaled two times at run time

					int w = 300;
					int h = 200;
					BufferedImage bi = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
					Graphics g = bi.getGraphics();
					g.drawImage(img, 0, 0, w, h, null);
					ImageIO.write(bi, "png", bos);

					fotoMainPage = new DefaultStreamedContent(new ByteArrayInputStream(bos.toByteArray()), "image/png");
					return fotoMainPage;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void setFotoMainPage(StreamedContent foto) {
		this.fotoMainPage = foto;
	}

	public StreamedContent getFotoOriginal() {
		FacesContext context = FacesContext.getCurrentInstance();
		String path = context.getExternalContext().getRequestParameterMap().get("pathFoto");
		try {
			if (context.getCurrentPhaseId() == PhaseId.RENDER_RESPONSE) {
				return new DefaultStreamedContent();

			} else {

				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				System.out.println("path" + path);
				if (path != null && !path.isEmpty()) {

					BufferedImage img = ImageIO.read(new FileInputStream(path));
					System.out.println("img.getWidth()" + img.getWidth());
					System.out.println(img.getHeight());
					ImageIO.write(img, "png", bos);
					fotoOriginal = new DefaultStreamedContent(new ByteArrayInputStream(bos.toByteArray()), "image/png");
					return fotoOriginal;
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void setFotoOriginal(StreamedContent fotoOriginal) {
		this.fotoOriginal = fotoOriginal;
	}

	public String getPathFoto() {
		return pathFoto;
	}

	public void setPathFoto(String pathFoto) {
		System.out.println("pathFoto " + pathFoto);
		this.pathFoto = pathFoto;
	}

	public void showViewImg(String path) {
		setPathFoto(path);
		RequestContext context = RequestContext.getCurrentInstance();
		context.execute("PF('viewImgOriginal').show();");

	}

	public void setFoto(Foto foto) {
		System.out.println("foto set");
		this.foto = foto;
	}

	public Foto getFoto() {
		return foto;
	}

	public void dowload(ArrayList<Foto> fotolistMostrar) throws IOException {

		HashMap<String, Foto> mapFotos = new HashMap<>();
		ArrayList<Foto> listFotoDescarga = fotolistMostrar;
		HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext()
				.getResponse();
		// se quitan fotos duplicadas
		for (int i = 0; i < listFotoDescarga.size(); i++) {
			mapFotos.put(listFotoDescarga.get(i).getFotoPath(), listFotoDescarga.get(i));
		}
		System.out.println("mapFotos" + mapFotos.entrySet().size());

		Iterator<Map.Entry<String, Foto>> it = mapFotos.entrySet().iterator();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		ZipOutputStream out = new ZipOutputStream(os);
		int j=0;
		while (it.hasNext()) {
			Map.Entry<String, Foto> pair = it.next();
			Foto foto = (Foto) pair.getValue();
			System.out.println("path" + foto.getFotoPath());
			BufferedImage img = ImageIO.read(new FileInputStream(foto.getFotoPath()));
			System.out.println("img" + img.getHeight());
			ZipEntry entry = new ZipEntry(foto.getSitio().getId().getCveSitio()+j+".jpg");
			out.putNextEntry(entry);					
			ImageIO.write(img, "jpg", out);			
			out.closeEntry();
			j++;

		}
		out.close();

		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment;filename=fotos.zip");
		response.getOutputStream().write(os.toByteArray());
		response.getOutputStream().flush();
		response.getOutputStream().close();
		response.setStatus(0);
		FacesContext.getCurrentInstance().responseComplete();
	}

}
