package com.gardener.mappers;

import com.gardener.domain.Post;

import java.util.List;

public interface LibraryMapper {

  List<Post> getAllFavoritePost(String loginid);

}
