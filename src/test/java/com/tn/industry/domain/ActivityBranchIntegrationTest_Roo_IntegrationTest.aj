// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.domain;

import com.tn.industry.domain.ActivityBranch;
import com.tn.industry.domain.ActivityBranchDataOnDemand;
import com.tn.industry.domain.ActivityBranchIntegrationTest;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ActivityBranchIntegrationTest_Roo_IntegrationTest {
    
    declare @type: ActivityBranchIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: ActivityBranchIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: ActivityBranchIntegrationTest: @Transactional;
    
    @Autowired
    private ActivityBranchDataOnDemand ActivityBranchIntegrationTest.dod;
    
    @Test
    public void ActivityBranchIntegrationTest.testCountActivityBranches() {
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", dod.getRandomActivityBranch());
        long count = ActivityBranch.countActivityBranches();
        Assert.assertTrue("Counter for 'ActivityBranch' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testFindActivityBranch() {
        ActivityBranch obj = dod.getRandomActivityBranch();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to provide an identifier", id);
        obj = ActivityBranch.findActivityBranch(id);
        Assert.assertNotNull("Find method for 'ActivityBranch' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'ActivityBranch' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testFindAllActivityBranches() {
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", dod.getRandomActivityBranch());
        long count = ActivityBranch.countActivityBranches();
        Assert.assertTrue("Too expensive to perform a find all test for 'ActivityBranch', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<ActivityBranch> result = ActivityBranch.findAllActivityBranches();
        Assert.assertNotNull("Find all method for 'ActivityBranch' illegally returned null", result);
        Assert.assertTrue("Find all method for 'ActivityBranch' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testFindActivityBranchEntries() {
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", dod.getRandomActivityBranch());
        long count = ActivityBranch.countActivityBranches();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<ActivityBranch> result = ActivityBranch.findActivityBranchEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'ActivityBranch' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'ActivityBranch' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testFlush() {
        ActivityBranch obj = dod.getRandomActivityBranch();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to provide an identifier", id);
        obj = ActivityBranch.findActivityBranch(id);
        Assert.assertNotNull("Find method for 'ActivityBranch' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyActivityBranch(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'ActivityBranch' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testMergeUpdate() {
        ActivityBranch obj = dod.getRandomActivityBranch();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to provide an identifier", id);
        obj = ActivityBranch.findActivityBranch(id);
        boolean modified =  dod.modifyActivityBranch(obj);
        Integer currentVersion = obj.getVersion();
        ActivityBranch merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'ActivityBranch' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", dod.getRandomActivityBranch());
        ActivityBranch obj = dod.getNewTransientActivityBranch(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'ActivityBranch' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'ActivityBranch' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void ActivityBranchIntegrationTest.testRemove() {
        ActivityBranch obj = dod.getRandomActivityBranch();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'ActivityBranch' failed to provide an identifier", id);
        obj = ActivityBranch.findActivityBranch(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'ActivityBranch' with identifier '" + id + "'", ActivityBranch.findActivityBranch(id));
    }
    
}
