package com.example.demo.Controller;


import com.example.demo.Entity.Category;
import com.example.demo.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @PostMapping(path = "/addCategory")
    public Category create(@RequestBody Category category){
        return  categoryService.createCategory(category);
    }

    @GetMapping(path = "/allCategory")
    public List<Category> getAllCategory(){
        return categoryService.getAll();
    }

    @GetMapping(path = "/{id}")
    public Category getCategoryById(@PathVariable ("id") Integer id) throws Exception{
        return categoryService.findById(id);
    }

    @GetMapping(path = "/title/{title}")
    public List<Category> getCategoryByTitle(@PathVariable ("title") String title){
        if(title.equals("")){
            return null;
        }else{
            return categoryService.findByTitle(title);
        }
    }

    @DeleteMapping(path = "/delete/{id}")
    public ResponseEntity<?> deleteById(@PathVariable ("id") Integer id){
        try{
            categoryService.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } catch (Exception e){
            return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
        }
    }

}
