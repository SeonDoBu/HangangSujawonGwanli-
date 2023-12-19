package egovframework.example.sample.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Paging;

import egovframework.example.sample.dto.ObservData;

import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.CommoncodeService;
import egovframework.example.sample.service.DistrictService;
import egovframework.example.sample.service.GigwanService;
import egovframework.example.sample.service.ObservDataService;
import egovframework.example.sample.service.SiseolService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.sample.dto.Sluice;
import egovframework.example.sample.service.SluiceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SluiceController {

	private final CommoncodeService commoncodeService;
	private final DistrictService   districtService;
	private final SiseolService     siseolSerivce;
	private final SluiceService 	ss;
	private final ObservDataService obs;
	private final GigwanService     gigwanService;
	

	// 수자원시설물 목록으로 이동 by 나희
	@GetMapping(value = "sujawonList.do")
	public String sujawonList(Siseol siseol, String currentPage, Model model) {
		log.info("sujawonList Start...");
		try {
			// 시설물 종류 select box 옵션 만들기
			Commoncode cc = new Commoncode();
			cc.setBig_code(2); // 시설물 종류 big_code 강제 지정
			List<Commoncode> siseolType = commoncodeService.commoncodeList(cc);
			
			// 관리기관 select box 옵션 만들기
			List<Gigwan> gigwanList = gigwanService.gigwanList();
			
			// 행정구역 select box 옵션 만들기
			List<District> districtList = districtService.districtList();
			
			// 조건에 해당하는 시설물 총 개수 구하기
			int totalSiseol = siseolSerivce.count(siseol);
			
			// 페이징 처리
			Paging page = new Paging(totalSiseol, currentPage);
			siseol.setStart(page.getStart());
			siseol.setEnd(page.getEnd());
			
			// 조건에 해당하는 시설물 리스트 가져오기
			List<Siseol> siseolList = siseolSerivce.siseolList(siseol);
			log.info("siseol_id"+siseol.getSiseol_id());
			
			model.addAttribute("page", page);
			model.addAttribute("siseol", siseol);
			model.addAttribute("totalSiseol", totalSiseol);
			model.addAttribute("siseolType", siseolType);
			model.addAttribute("gigwanList", gigwanList);
			model.addAttribute("districtList", districtList);
			model.addAttribute("siseolList", siseolList);
			model.addAttribute("currentPage", currentPage);
			
		} catch (Exception e) {
			log.info("sujawonList" + e.getMessage());
		} finally {
			log.info("sujawonList End...");
		}
		return "sluice/sujawonList";
	}

	// 수자원시설물 상세정보 페이지로 이동 by 나희
	@GetMapping(value = "sujawonDetail.do")
	public String sujawonDetail(int siseolId, Model model) {
		log.info("sujawonDetail Start...");
		try {
			// 시설물 종류 select box 옵션 만들기
			Commoncode cc = new Commoncode();
			cc.setBig_code(2); // 시설물 종류 big_code 강제 지정
			List<Commoncode> siseolType = commoncodeService.commoncodeList(cc);
			
			// 관리기관 select box 옵션 만들기
			List<Gigwan> gigwanList = gigwanService.gigwanList();
			
			// 행정구역 select box 옵션 만들기
			List<District> districtList = districtService.districtList();
			
			// siseolId에 해당하는 시설물 정보 가져오기
			Siseol siseol = siseolSerivce.siseolDetail(siseolId);
			
			model.addAttribute("siseolType", siseolType);
			model.addAttribute("gigwanList", gigwanList);
			model.addAttribute("districtList", districtList);
			model.addAttribute("siseol", siseol);
			
		} catch (Exception e) {
			log.info("sujawonDetail " + e.getMessage());
		} finally {
			log.info("sujawonDetail End...");
		}
		return "sluice/sujawonDetail";
	}

	// 수자원시설물 정보 새 등록 페이지로 이동 by 나희
	@GetMapping(value = "sujawonInsertForm.do")
	public String sujawonInsertForm(Model model) {
		log.info("sujawonInsertForm Start...");
		try {
			// 시설물 종류 select box 옵션 만들기
			Commoncode cc = new Commoncode();
			cc.setBig_code(2); // 시설물 종류 big_code 강제 지정
			List<Commoncode> siseolType = commoncodeService.commoncodeList(cc);
				
			// 관리기관 select box 옵션 만들기
			List<Gigwan> gigwanList = gigwanService.gigwanList();
			
			// 행정구역 select box 옵션 만들기
			List<District> districtList = districtService.districtList();
		
			model.addAttribute("siseolType", siseolType);
			model.addAttribute("gigwanList", gigwanList);
			model.addAttribute("districtList", districtList);
		} catch (Exception e) {
			log.info("sujawonInsertForm " + e.getMessage());
		} finally {
			log.info("sujawonInsertForm End...");
		}
		return "sluice/sujawonInsert";
	}

	// 수자원시설물 정보 등록 by 나희
	@PostMapping(value = "sujawonInsert.do")
	public String sujawonInsert(Siseol siseol, Model model) {
		log.info("sujawonInsert Start...");
		int result = 0;
		try {
			result = siseolSerivce.siseolInsert(siseol);
			log.info("sujawonInsert result => " + result);
			// insert한 result 값에 따라 다른 msg 출력
			if(result == 1) {
				model.addAttribute("msg", "성공적으로 등록되었습니다.");
			} else {
				model.addAttribute("msg", "등록에 실패하였습니다.");
				// return "forward:sujawonInsertForm.do";
			}
		} catch (Exception e) {
			log.info("sujawonInsert " + e.getMessage());
		} finally {
			log.info("sujawonInsert End...");
		}
		return "sluice/sujawonInsert";
	}

	// 수자원시설물 정보 수정 by 나희
	@PostMapping(value = "sujawonUpdate.do")
	public String sujawonUpdate(Siseol siseol, Model model) {
		log.info("sujawonUpdate Start...");
		int result = 0;
		try {
			result = siseolSerivce.siseolUpdate(siseol);
			log.info("sujawonUpdate result => " + result);
			// update한 result 값에 따라 다른 msg 출력
			if(result == 1) {
				// model.addAttribute("successMsg", "성공적으로 수정하였습니다.");
				model.addAttribute("msg", "성공적으로 수정하였습니다.");
			} else {
				// model.addAttribute("failMsg", "수정에 실패하였습니다.");
				model.addAttribute("msg", "수정에 실패하였습니다.");
			}
		} catch (Exception e) {
			log.info("sujawonUpdate " + e.getMessage());
		} finally {
			log.info("sujawonUpdate End...");
		}
		// return "forward:/sujawonDetail.do?siseolId="+siseol.getSiseol_id();
		return "sluice/sujawonList";
	}

	// 수자원시설물 정보 삭제(is_deleted 값 수정) by 나희
	@PostMapping(value = "sujawonDelete.do")
	public String sujawonDelete(Siseol siseol, Model model) {
		log.info("sujawonDelete Start...");
		int result = 0;
		String url = "";
		try {
			int siseolId = siseol.getSiseol_id();
			result = siseolSerivce.siseolDelete(siseolId);
			log.info("sujawonDelete result => " + result);
			// delete한 result 값에 따라 다른 msg 출력
			if(result == 1) {
				model.addAttribute("msg", "성공적으로 삭제하였습니다.");
				url = "sluice/sujawonList";
			} else {
				// model.addAttribute("failMsg", "삭제에 실패하였습니다.");
				// url = "forward:/sujawonDetail.do?siseolId="+siseolId;
				model.addAttribute("msg", "삭제에 실패하였습니다.");
				url = "sluice/sujawonList";
			}
		} catch (Exception e) {
			log.info("sujawonDelete " + e.getMessage());
		} finally {
			log.info("sujawonDelete End...");
		}
		return url;
	}

	@RequestMapping(value = "sujawonStatistics.do")
	public String sujawonStatistics() {
		return "sluice/sujawonStatistics";
	}

	
	
	//수문 지도 메인 맵핑
	@GetMapping(value = "/sluiceMain")
	public String SluiceMain(Model model) {
	
	
	return "sluice/sluiceMain";
	
	}
	
	
	
	
	@GetMapping(value = "sluiceList")
	public String SluiceList(Sluice sluice,ObservData observData,String currentPage, Model model) {
	

		int SluiceCount = ss.sluiceCount();
		int ObservCount = obs.observCount();
		
		Paging page = new Paging(SluiceCount, currentPage);
		
		sluice.setStart(page.getStart());
		sluice.setEnd(page.getEnd());
		
		
		List<Sluice> SluiceList = ss.sluiceList(sluice);
		List<ObservData> ObservDataList = obs.observDataList(observData);
		/*
		 * System.out.println("1234455"+observData.getType());
		 * System.out.println("observDataList"+ObservDataList.getClass());
		 * System.out.println("SluiceList sluiceController get start()->"+sluice.
		 * getStart());
		 */
		
		/* System.out.println(SluiceList); */
		
		model.addAttribute("page",page);
		model.addAttribute("currentPage",currentPage);
		
		
		//조회 
		model.addAttribute("SluiceList",SluiceList);
		model.addAttribute("ObservDataList",ObservDataList);
		model.addAttribute("ObservData",observData);
		//count
		model.addAttribute("SluiceCount",SluiceCount);
		model.addAttribute("ObservCount",ObservCount);
		
	return "sluice/sluiceList";
	

	}

	@GetMapping("sluiceInsert")
	public String insertFormMove(Model model) {

		return "/sluice/sluiceInsert";
	}

	@PostMapping(value = "sluiceInsert1")
	public String sluiceInsert(@ModelAttribute Sluice sluice, Model model, Sluice sluice_id) {

		int insertResult = 0;

		insertResult = ss.insertSluice(sluice);

		System.out.println(sluice.getSluice_id());
		System.out.println(sluice.getClass());

		return "/sluice/sluiceInsert";
	}

	@GetMapping(value = "/sluiceDetail")
	public String sluiceDetail(int sluice_id, Model model) {
		System.out.println("sluiceDetail start");

		Sluice sluice = ss.sluiceDetail(sluice_id);
		
		System.out.println("sluiceDetail"+sluice_id);
		
		model.addAttribute("sluice", sluice);

		return "sluice/sluiceDetail";
	}

	
	

	
	
	
	//관측 데이터 시작 
	@GetMapping(value = "/ObservDataList")
	public String ObservDataList(Sluice sluice,int sluice_id,ObservData observData,String currentPage, Model model) {
	
		int SluiceCount = ss.sluiceCount();
		int ObservCount = obs.observCount();
	
		//이름 가져오기 
		Sluice sluice2 = ss.sluiceDetail(sluice_id);
		// 페이징 처리
		Paging page = new Paging(ObservCount, currentPage);
		observData.setStart(page.getStart());
		observData.setEnd(page.getEnd());
		
		
		List<Sluice> SluiceList = ss.sluiceList(sluice);
		List<ObservData> ObservDataList = obs.observDataList(observData);
		System.out.println("SluiceList"+SluiceList);
		System.out.println("sluice"+sluice);
	
		/*
		 * System.out.println("========================"+ObservDataList);
		 * System.out.println("========================="+observData.getName());
		 * System.out.println("===============sluice"+sluice2.getName());
		 * System.out.println("-------------");
		 */
		/* System.out.println(SluiceList); */
		/*
		 * System.out.println("====================는뭘까"+observData);
		 * System.out.println("================는뭘까2"+ObservDataList);
		 * System.out.println("============"+page.getRowPage());
		 * System.out.println("=============="+page.getTotal());
		 */
		model.addAttribute("page",page);
		model.addAttribute("currentPage",currentPage);
		
		//조회 
		model.addAttribute("SluiceList",SluiceList);
		model.addAttribute("ObservDataList",ObservDataList);
		model.addAttribute("ObservData",observData);
		model.addAttribute("sluice",sluice2);
		//count
		model.addAttribute("SluiceCount",SluiceCount);
		model.addAttribute("ObservCount",ObservCount);
		
	return "sluice/sluiceTypeList";
	
	}
	@GetMapping(value = "observdataDetail")
	public String observdataDetail(Sluice sluice, ObservData observData, int sluice_id,String type,String data_ymd, Model model) {
		System.out.println("sluiceDetail start");

		ObservData observDataD = obs.observdataDetail(observData);
		//이름 가져오기 
		Sluice sluice2 = ss.sluiceDetail(sluice_id);
		System.out.println("observData--------------"+observData);
		System.out.println("observDataD-------------"+observDataD);
		model.addAttribute("sluice",sluice2);
		model.addAttribute("observDataD", observDataD);
		model.addAttribute("observData",observData);
		
		return "sluice/sluiceTypeUpdate";
	}
	
	@PostMapping(value = "observdataUpdate")
	public String updateObserv(Sluice sluice,ObservData observData, Model model) {
		log.info("updateObserv start");
		try {
			int updateCount = ss.updateSluice(sluice);
			int updateCount2 = obs.updateObserv(observData);
			ObservData observDataD = obs.observdataDetail(observData);
			System.out.println("sssssssss----------"+updateCount2);
			System.out.println("======================"+observData);
			model.addAttribute("upcnt2",updateCount2);
			model.addAttribute("sluice",sluice);
			model.addAttribute("observData",observData);
			model.addAttribute("observDataD", observDataD);		
			log.info("updateObserv");
			
			
		} catch (Exception e) {
			log.error(e.getMessage());
		}
	
		
		return "sluice/sluiceTypeList";

	}
	@PostMapping(value = "updateSluice")
	public String updateSluice(@ModelAttribute Sluice sluice, Model model) {
		
		int updateCount = ss.updateSluice(sluice);
		
		System.out.println("updateSluice"+sluice.getMapx());
		System.out.println("updateSluice"+sluice.getSluice_id());
		model.addAttribute("upcnt",updateCount);
		model.addAttribute("sluice",sluice);
		
		return "redirect:sluiceList";
		
	}
	
	


}
