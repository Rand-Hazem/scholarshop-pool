package com.iteam.scholarships.service;

import com.iteam.scholarships.entity.StoryReport;
import com.iteam.scholarships.repository.StoryReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class ReportService {

    @Autowired
    private StoryReportRepository storyReportRepository;

    public boolean report(StoryReport storyReport){
        return storyReportRepository.save(storyReport) !=null
                && storyReport.getId() >0;
    }

}
