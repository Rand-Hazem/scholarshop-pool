package com.iteam.scholarships.repository;

import com.iteam.scholarships.entity.StoryReport;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoryReportRepository extends CrudRepository<StoryReport, Integer> {
}
