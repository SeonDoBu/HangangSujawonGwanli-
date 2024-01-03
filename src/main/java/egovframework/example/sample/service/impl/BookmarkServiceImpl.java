package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.example.sample.dto.Bookmark;
import egovframework.example.sample.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class BookmarkServiceImpl extends EgovAbstractServiceImpl implements BookmarkService {
	
	private final BookmarkMapper bookmarkDao;

	@Override
	public int saveBookmarkSs(Bookmark bookmark) {
		log.info("saveBookmarkSs Start...");
		int result = 0;
		try {
			result = bookmarkDao.saveBookmarkSs(bookmark);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("saveBookmarkSs End...");
		}
		return result;
	}

	@Override
	public List<Bookmark> getBookmarkListUser(Bookmark bookmark) {
		log.info("getBookmarkListUser Start...");
		List<Bookmark> bookmarkList = null;
		try {
			bookmarkList = bookmarkDao.getBookmarkListUser(bookmark);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("getBookmarkListUser End...");
		}
		return bookmarkList;
	}

	@Override
	public int bookmarkUserCount(Bookmark bookmark) {
		log.info("bookmarkUserCount Start...");
		int count = 0;
		try {
			count = bookmarkDao.bookmarkUserCount(bookmark);
		} catch (Exception e) {
			log.error(e.getMessage());
		} finally {
			log.info("bookmarkUserCount End...");
		}
		return count;
	}
	
}
