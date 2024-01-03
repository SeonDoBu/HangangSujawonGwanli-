package egovframework.example.sample.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.util.Strings;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import egovframework.example.sample.dto.Commoncode;
import egovframework.example.sample.dto.District;
import egovframework.example.sample.dto.Gigwan;
import egovframework.example.sample.dto.Paging;

import egovframework.example.sample.dto.ObservData;

import egovframework.example.sample.dto.Siseol;
import egovframework.example.sample.service.BookmarkService;
import egovframework.example.sample.service.CommoncodeService;
import egovframework.example.sample.service.DistrictService;
import egovframework.example.sample.service.GigwanService;
import egovframework.example.sample.service.ObservDataService;
import egovframework.example.sample.service.SiseolService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.dto.Sluice;
import egovframework.example.sample.service.SluiceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SluiceController {

	private static final int String = 0;
	private final CommoncodeService commoncodeService;
	private final DistrictService   districtService;
	private final SiseolService     siseolService;
	private final SluiceService 	ss;
	private final ObservDataService obs;
	private final GigwanService     gigwanService;
	private final BookmarkService   bookmarkService;
	
	

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
			int totalSiseol = siseolService.count(siseol);
			
			// 페이징 처리
			Paging page = new Paging(totalSiseol, currentPage);
			siseol.setStart(page.getStart());
			siseol.setEnd(page.getEnd());
			
			// 조건에 해당하는 시설물 리스트 가져오기
			List<Siseol> siseolList = siseolService.siseolList(siseol);
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
			Siseol siseol = siseolService.siseolDetail(siseolId);
			
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
			result = siseolService.siseolInsert(siseol);
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
			result = siseolService.siseolUpdate(siseol);
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
			result = siseolService.siseolDelete(siseolId);
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

	// 수자원정보 통계 페이지로 이동 by 나희
	@GetMapping(value = "sujawonStatistics.do")
	public String sujawonStatistics(Model model) {
		log.info("sujawonStatistics Start...");
		try {
			// todo: map 형태로 바꿔서 전달하기
			// 수자원시설물 비율 파이 차트 데이터
			int pieCnt1 = siseolService.getSiseolCount(1); // 댐 
			int pieCnt2 = siseolService.getSiseolCount(2); // 저수지 
			int pieCnt3 = siseolService.getSiseolCount(3); // 펌프장 
			int pieCnt4 = siseolService.getSiseolCount(4); // 관개수로
			
			model.addAttribute("pieCnt1", pieCnt1);
			model.addAttribute("pieCnt2", pieCnt2);
			model.addAttribute("pieCnt3", pieCnt3);
			model.addAttribute("pieCnt4", pieCnt4);
			
			// 행정구역별 수자원시설물 라인 차트 데이터
			
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("sujawonStatistics End...");
		}
		return "sluice/sujawonStatistics";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "siseolDataList", method = RequestMethod.GET)
	public List<Siseol> siseolDataList(String sc1, String sc2, String sc3, String sc4) {
		log.info("siseolDataList Start...");
		List<Siseol> siseolList = null;
		try {
			Map<String, Object> chkMap = new HashMap<String, Object>();
			chkMap.put("sc1", sc1);
			chkMap.put("sc2", sc2);
			chkMap.put("sc3", sc3);
			chkMap.put("sc4", sc4);
			log.info(chkMap.toString());
			siseolList = siseolService.getSiseolData(chkMap);
			log.info("siseolList"+siseolList.size());
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("siseolDataList End...");
		}
		return siseolList;
	}
	
	
	//수문 지도 메인 맵핑
	@GetMapping(value = "/sluiceMain")
	public String SluiceMain(Sluice sluice,  Model model,String currentPage) {
				
		int sluiceCnt = ss.sluiceCount();

		
		Paging page = new Paging(sluiceCnt, currentPage);
		
		sluice.setStart(page.getStart());
		sluice.setEnd(page.getEnd());
		
		List<Sluice> SluiceList = ss.sluiceList(sluice);
		
		model.addAttribute("page",page);
		model.addAttribute("currentPage",currentPage);
		
				model.addAttribute("sluiceCnt", sluiceCnt);
				model.addAttribute("SluiceList",SluiceList);
		return "sluice/sluiceMain";
	}
	
	@ResponseBody
	@RequestMapping(value = "/sluiceDataList")
	public List<Sluice> sluiceDataList(Sluice sluice, String type1, String type2, String type3, String type4, Model model) {
		int sluiceCnt = ss.sluiceCount();
		log.info("안뇽");
		/* Sluice sluice = new Sluice(); */
		/*
		 * sluice.setStart(1); sluice.setEnd(sluiceCnt);
		 */
		/*
		 * String[] typeList = new String[4]; typeList[0] = type5; typeList[1] = type1;
		 * typeList[2] = type5; typeList[3] = type4;
		 * System.out.println("typeList->"+typeList[1]);
		 * System.out.println("typeList->"+typeList[3]);
		 * System.out.println("typeList->"+typeList[0]);
		 * System.out.println("typeList->"+typeList[2]);
		 * 
		 * sluice.setTypeList(typeList);
		 * 
		 * 
		 * if (type5 == "1") { sluice.setType(type5); }else if (type4 == "4") {
		 * sluice.setType(type4); }else if (type1 == "2") { sluice.setType(type1); }
		 * else {
		 * 
		 * }
		 */

		//System.out.println("valvalval"+type5.getClass().getName());
		
		/*
		 * System.out.println("vlavlavalget.type1->"+sluice.getType1());
		 * System.out.println("vlavlavalget.type4->"+sluice.getType4());
		 * System.out.println("vlavlavalget.type5->"+sluice.getType5());
		 */
		// System.out.println("valvalval value 2 -->"+type5);
		System.out.println("valvalval1 value 4 -> "+type1);
		System.out.println("valvalval4"+type4);
		System.out.println("vlavlavalget.type->"+sluice.getType());

		Map<String, Object> chkmap = new HashMap<String, Object>();
		chkmap.put("type1", type1);
		chkmap.put("type2", type2);
		chkmap.put("type3", type3);
		chkmap.put("type4", type4);
		sluice.setChkmap(chkmap); 
		/* model.addAttribute(sluice); */
		List<Sluice> sluiceList = ss.sluiceList(sluice);
		log.info(sluiceList.toString());
		return sluiceList;
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
			ObservData observDataD = obs.observdataDetail(observData);
			int updateCount = ss.updateSluice(sluice);
			int updateCount2 = obs.updateObserv(observData);
			
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
