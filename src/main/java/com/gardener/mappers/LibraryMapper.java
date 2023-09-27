package com.gardener.mappers;

import com.gardener.domain.Post;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LibraryMapper {

  List<Post> getAllFavoritePost(String loginid);

  List<Post> getAllFavoritePostWithPaging(@Param("loginid") String loginid, @Param("num") int num);

}
