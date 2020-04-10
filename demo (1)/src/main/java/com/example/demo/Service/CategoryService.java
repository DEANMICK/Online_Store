package com.example.demo.Service;

import com.example.demo.Entity.Category;
import com.example.demo.Repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    public Category createCategory(Category category){
        return categoryRepository.save(category);
    }

    public List<Category> getAll(){
        return categoryRepository.findAll();
    }

    public Category findById(Integer id) throws Exception {
        return categoryRepository.findById(id).orElseThrow(Exception::new);
    }

    public List<Category> findByTitle(String title){
        return categoryRepository.findByTitleContaining(title);
    }

    public String deleteById(Integer id) {
        categoryRepository.deleteById(id);
        return "Category id = " + id + " has been fired!";
    }
}
