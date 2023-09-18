package com.gardener.mappers;

import com.gardener.domain.Post;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PostMapper {
  Long insert(Post post);

  Post findById(Long id);

  List<Post> findAll();
}
