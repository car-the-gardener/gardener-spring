package com.gardener.mappers;

import com.gardener.domain.Reply;
import com.gardener.util.Criteria;
import com.gardener.util.ReplyPaging;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplyMapper {

  int insert(Reply reply);

  Reply findById(Long id);

  List<Reply> findAll(@Param("cri") Criteria cri, @Param("postNum") Long postNum);

  int delete(Long id);

  int update(Reply reply);

  int count(Long postNum);

}