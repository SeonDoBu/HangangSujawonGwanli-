package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.dto.Bookmark;

public interface BookmarkService {

	int saveBookmarkSs(Bookmark bookmark);

	List<Bookmark> getBookmarkListUser(Bookmark bookmark);
	
	int bookmarkUserCount(Bookmark bookmark);

}
