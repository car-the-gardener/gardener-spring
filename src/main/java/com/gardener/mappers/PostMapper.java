package com.gardener.mappers;

import com.gardener.domain.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Mapper
public interface PostMapper {
  Long insert(Post post);

  Post findBypostnum(Long postnum);

  List<Post> findAll();

  Long updatePost(Post post);

  void updateTotalCnt(@Param("postnum") Long postnum, @Param("totalCnt") int totalCnt);

  void updateFavorite(Long postnum);

  Long deletePost(Long postnum);
}
