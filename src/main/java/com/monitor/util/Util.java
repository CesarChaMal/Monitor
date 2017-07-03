package com.monitor.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import com.monitor.model.Campana;
import com.monitor.model.CampanaId;
import com.monitor.model.CliPro;
import com.monitor.model.Usuario;
import com.monitor.model.dto.CampanaDTO;
import com.monitor.model.dto.CliProDTO;
import com.monitor.model.dto.PlazaDTO;
import com.monitor.model.dto.SitioDTO;
import com.monitor.model.dto.UsuarioDTO;

public class Util {

	public ArrayList<PlazaDTO> getPlazasDTO(ArrayList<Object[]> plazasList) {
		ArrayList<PlazaDTO> plazaDTOList = new ArrayList<PlazaDTO>();
		for (Object[] result : plazasList) {
			PlazaDTO plazaDTO = new PlazaDTO();
			plazaDTO.setCvePlaza((String) result[0]);
			plazaDTO.setNombre((String) result[1]);
			plazaDTO.setStatus((Integer) result[2]);
			plazaDTO.setPadre((String) result[3]);
			plazaDTO.setTipo((Integer) result[4]);
			plazaDTO.setCveClipro((String) result[5]);
			plazaDTOList.add(plazaDTO);
		}
		return plazaDTOList;
	}
	
	public ArrayList<CampanaDTO> getCampanasDTO(ArrayList<Object[]> campanasList) {
		ArrayList<CampanaDTO> campanaDTOList = new ArrayList<CampanaDTO>();
		for (Object[] result : campanasList) {
			Campana campana = (Campana) result[0];
			CampanaId id = (CampanaId) campana.getId();
			CliPro clipro = (CliPro) result[1];
			
			CampanaDTO campanaDTO = new CampanaDTO();
			campanaDTO.setCveCampana(id.getCveCampana());
			campanaDTO.setNombre(campana.getNombre());
			campanaDTO.setFechaalta(campana.getFechaalta());
			campanaDTO.setStatus(campana.getStatus());
			
			CliProDTO cliproDTO = new CliProDTO();
			cliproDTO.setCveClipro(clipro.getCveClipro());
			cliproDTO.setNombre(clipro.getNombre());
			cliproDTO.setTipo(clipro.getTipo());
			cliproDTO.setPadre(clipro.getPadre());
			
			campanaDTO.setClipro(cliproDTO);
			campanaDTOList.add(campanaDTO);
		}
		return campanaDTOList;
	}

	public ArrayList<SitioDTO> getSitiosDTO(ArrayList<Object[]> sitioList) {
		ArrayList<SitioDTO> sitioDTOList = new ArrayList<SitioDTO>();
		for (Object[] result : sitioList) {
			SitioDTO sitioDTO = new SitioDTO();
			sitioDTO.setCveSitio((String) result[0]);
			sitioDTO.setCveCampana((String) result[1]);
			sitioDTO.setCveClipro((String) result[2]);
			sitioDTO.setCvePlaza((String) result[3]);
			sitioDTO.setInicia((Date) result[4]);
			sitioDTO.setTermina((Date) result[5]);
			sitioDTO.setUbicacion((String) result[6]);
			sitioDTO.setStatus((Integer) result[7]);
			sitioDTO.setUbicacion((String) result[8]);
			sitioDTO.setIluminacion((Integer) result[9]);
			sitioDTOList.add(sitioDTO);
		}
		return sitioDTOList;

	}

	public ArrayList<UsuarioDTO> getUsuariosDTO(ArrayList<Object[]> usuariosList) {
		ArrayList<UsuarioDTO> usuarioDTOList = new ArrayList<UsuarioDTO>();
		for (Object[] result : usuariosList) {
			Usuario usuario = (Usuario) result[0];
			CliPro clipro = (CliPro) result[1];
			
			UsuarioDTO usuarioDTO = new UsuarioDTO();
			usuarioDTO.setEmail(usuario.getEmail());
			usuarioDTO.setNombre(usuario.getNombre());
			usuarioDTO.setApellidos(usuario.getApellidos());
			usuarioDTO.setContrasena(usuario.getContrasena());
			usuarioDTO.setTipo(usuario.getTipo());
			usuarioDTO.setFechaalta(usuario.getFechaalta());
			usuarioDTO.setStatus(usuario.getStatus());
			
			CliProDTO cliproDTO = new CliProDTO();
			cliproDTO.setCveClipro(clipro.getCveClipro());
			cliproDTO.setNombre(clipro.getNombre());
			cliproDTO.setTipo(clipro.getTipo());
			cliproDTO.setPadre(clipro.getPadre());
			
			usuarioDTO.setClipro(cliproDTO);
			usuarioDTOList.add(usuarioDTO);
		}
		return usuarioDTOList;
	}

	public Date formatDate(Date date) throws Exception {
		if(date!=null){
			SimpleDateFormat dt = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy",Locale.ENGLISH);			
			String dateString =dt.format(date);
			System.out.println("dateString " +dateString);
		}
		return date;
	}
	
	public static boolean isParsable(String input){
	    boolean parsable = true;
	    try{
	        Integer.parseInt(input);
	    }catch(NumberFormatException e){
	        parsable = false;
	    }
	    return parsable;
	}	
}
