package com.monitor.controller;

import java.awt.Graphics;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.faces.event.PhaseId;
import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import org.primefaces.context.RequestContext;
import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.monitor.model.Foto;
import com.monitor.service.LoadImgService;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@ManagedBean
@RequestScoped
public class LoadImgServiceControllerBean {
	private static final Logger LOGGER = LoggerFactory.getLogger(LoadImgServiceControllerBean.class);
	private Foto foto;
	private StreamedContent fotoMainPage;
	private StreamedContent fotoOriginal;
	private String pathFoto;
	private LoadImgService loadImgService;

	@PostConstruct
	public void init() {
		loadImgService = new LoadImgService();
	}

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
		} catch (FileNotFoundException e) {

			LOGGER.error("Error : ", e);
			e.printStackTrace();
		} catch (IOException e) {
			LOGGER.error("Error : ", e);
			e.printStackTrace();
		} finally {
			ServletContext ctx = (ServletContext) FacesContext.getCurrentInstance().getExternalContext().getContext();
			ctx.getRealPath(File.separator);
			System.out.println();
			path = ctx.getRealPath(File.separator)+File.separator +"resources" + File.separator + "img" + File.separator + "noDisponible.jpg";
			fotoMainPage = getFotoMainPage(path);
		}

		return fotoMainPage;
	}

	public StreamedContent getFotoMainPage(String path) {
		FacesContext context = FacesContext.getCurrentInstance();

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
		} catch (FileNotFoundException e) {
			LOGGER.error("Error : ", e);
			e.printStackTrace();
		} catch (IOException e) {
			LOGGER.error("Error : ", e);
			e.printStackTrace();
		}

		return fotoMainPage;
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
				if (path != null && !path.isEmpty()) {

					BufferedImage img = ImageIO.read(new FileInputStream(path));
					ImageIO.write(img, "png", bos);
					fotoOriginal = new DefaultStreamedContent(new ByteArrayInputStream(bos.toByteArray()), "image/png");
					return fotoOriginal;
				}

			}
		} catch (Exception e) {
			LOGGER.error("Error : ", e);
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

		HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext()
				.getResponse();

		ByteArrayOutputStream os = loadImgService.dowload(fotolistMostrar);

		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment;filename=fotos.zip");
		response.getOutputStream().write(os.toByteArray());
		response.getOutputStream().flush();
		response.getOutputStream().close();
		response.setStatus(0);
		FacesContext.getCurrentInstance().responseComplete();
	}

	public void dowloadPorUsuario(String cveCliPro) throws Exception {

		HttpServletResponse response = (HttpServletResponse) FacesContext.getCurrentInstance().getExternalContext()
				.getResponse();
		ByteArrayOutputStream os = loadImgService.dowloadPorUsuario(cveCliPro);
		response.setContentType("application/zip");
		response.setHeader("Content-Disposition", "attachment;filename=fotos.zip");
		response.getOutputStream().write(os.toByteArray());
		response.getOutputStream().flush();
		response.getOutputStream().close();
		response.setStatus(0);
		FacesContext.getCurrentInstance().responseComplete();
	}

	public void downloadPDF(ArrayList<Foto> fotolistMostrar) throws IOException {
		FacesContext facesContext = FacesContext.getCurrentInstance();
		ExternalContext externalContext = facesContext.getExternalContext();
		HttpServletResponse response = (HttpServletResponse) externalContext.getResponse();
		JRBeanCollectionDataSource collectionBean = new JRBeanCollectionDataSource(fotolistMostrar);
		try {
			InputStream reportStream = facesContext.getExternalContext()
					.getResourceAsStream(File.separator + "reportes" + File.separator + "Monitor.jasper");
			ServletOutputStream servletOutputStream = response.getOutputStream();

			JasperPrint jasperPrint = JasperFillManager.fillReport(reportStream, new HashMap(), collectionBean);
			response.addHeader("Content-disposition", "attachment; filename=Monitor.pdf");

			JasperExportManager.exportReportToPdfStream(jasperPrint, servletOutputStream);
			servletOutputStream.flush();
			servletOutputStream.close();
		} catch (Exception e) {
			LOGGER.error("Error : ", e);
			e.printStackTrace();
		} finally {
			response.getOutputStream().close();
		}
		facesContext.responseComplete();

	}

}
