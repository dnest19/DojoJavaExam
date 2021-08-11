package com.davidnestor.jexam.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.davidnestor.jexam.models.Idea;
import com.davidnestor.jexam.repositories.IdeaRepository;

@Service
public class IdeaService {
	@Autowired
	private IdeaRepository iRepo;
	
	//findall
	public List<Idea> getIdeas(){
		return this.iRepo.findAll();
	}
	
	//get
	public Idea getById(Long id) {
		return this.iRepo.findById(id).orElse(null);
	}
	
	//create
	public Idea create(Idea idea) {
		return this.iRepo.save(idea);
	}
	
	//delete
	public void delete(Long id) {
		this.iRepo.deleteById(id);
	}
	
	//update
	public Idea updateIdea(Idea idea) {
		return this.iRepo.save(idea);
	}
}
