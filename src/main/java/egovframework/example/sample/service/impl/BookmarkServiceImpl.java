package egovframework.example.sample.service.impl;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BookmarkServiceImpl extends EgovAbstractServiceImpl implements BookmarkService {
	
	private final BookmarkMapper bookmarkDao;
	
}
