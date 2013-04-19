// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.tn.industry.domain;

import com.tn.industry.domain.ActivityBranch;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect ActivityBranch_Roo_Json {
    
    public String ActivityBranch.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static ActivityBranch ActivityBranch.fromJsonToActivityBranch(String json) {
        return new JSONDeserializer<ActivityBranch>().use(null, ActivityBranch.class).deserialize(json);
    }
    
    public static String ActivityBranch.toJsonArray(Collection<ActivityBranch> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<ActivityBranch> ActivityBranch.fromJsonArrayToActivityBranches(String json) {
        return new JSONDeserializer<List<ActivityBranch>>().use(null, ArrayList.class).use("values", ActivityBranch.class).deserialize(json);
    }
    
}
