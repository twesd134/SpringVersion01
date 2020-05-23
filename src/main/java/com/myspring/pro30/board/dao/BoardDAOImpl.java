package com.myspring.pro30.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.pro30.board.vo.ArticleVO;
import com.myspring.pro30.board.vo.ImageVO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	



	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllArticlesList() throws DataAccessException {
		
		List<ArticleVO> articlesList = articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		
		return articlesList;
		
	}
	//List쿼리

	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO(); //새글에 대한 글 번호를 가져옵니다.
		articleMap.put("articleNO", articleNO);  //글 번호를 articleNO로 저장합니다.
		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
		//id 에 대한 insert문을 호출하면서 articleMap을 전달합니다.
		return articleNO;
	}
    
	//다중 파일 업로드
	/*
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int articleNO = (Integer)articleMap.get("articleNO");
		int imageFileNO = selectNewImageFileNO();
		for(ImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setArticleNO(articleNO);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}
	
   */
	
	@Override
	public ArticleVO selectArticle(int articleNO) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", articleNO);
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	
	}

	@Override
	public void deleteArticle(int articleNO) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", articleNO);
		
	}
	
	@Override
	public List selectImageFileList(int articleNO) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList",articleNO);
		return imageFileList;
	}
	//이미지 리스트를 가져옵니다.
	
	private int selectNewArticleNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}
	//새글 번호를 가져옵니다.
	
	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}
	//이미지 번호를 가져옵니다.
	
	@Override
	public int addReply(Map articleMap) throws DataAccessException {
		int articleNO = selectNewArticleNO();
		articleMap.put("articleNO",articleNO);
		sqlSession.insert("mapper.board.addreply",articleMap);
		return articleNO;
		
	}

	
	
	@Override
	public int updateNO(Map articleMap) throws DataAccessException {
		// TODO Auto-generated method stub
		return sqlSession.update("mapper.board.updateNO");
	}
	
}
