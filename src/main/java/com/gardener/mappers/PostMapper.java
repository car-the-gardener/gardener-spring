package com.gardener.mappers;

import com.gardener.domain.Post;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
  Long insert(Post post);

  Post findBypostnum(Long postnum);

  List<Post> findAll();

  Long updatePost(Post post);

  Long updateFavorite(Long postnum);

  Long deletePost(Long postnum);
}
