package egovframework.example.sample.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.sample.dto.Bookmark;

@Mapper("bookmarkMapper")
public interface BookmarkMapper {

	int saveBookmarkSs(Bookmark bookmark);

	List<Bookmark> getBookmarkListUser(Bookmark bookmark);
	
	int bookmarkUserCount(Bookmark bookmark);

}
