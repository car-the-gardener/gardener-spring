package com.gardener.service;

import com.gardener.domain.Post;
import com.gardener.mappers.LibraryMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LibraryService {

  private final LibraryMapper libraryMapper;

  public List<Post> getAllFavoritePost(String loginid) {
    return libraryMapper.getAllFavoritePost(loginid);
  }
}
