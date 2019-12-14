package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.storydb.StoryReport;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoryReportRepository extends CrudRepository<StoryReport, Integer> {
}
