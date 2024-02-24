use std::env;
use std::error::Error; 
use globwalk::GlobWalkerBuilder;

fn main() -> Result<(), Box<dyn Error>> { 
    let arguments: Vec<String> = env::args().collect();
    if arguments.len() < 2 {
        eprintln!("Usage: either <Path> and [Pattern] or <Path>");
        std::process::exit(1);
    }

    let base_path = &arguments[1];
    let pattern = if arguments.len() > 2 { &arguments[2] } else { "*" };

    search_execute_ls(base_path, pattern)
}

fn search_execute_ls(path: &str, pattern: &str) -> Result<(), Box<dyn Error>> {
    let effective_pattern = if pattern == "*" { "**/*" } else { pattern };

    let walker = GlobWalkerBuilder::from_patterns(path, &[effective_pattern])
        .build()
        .map_err(|e| Box::new(e) as Box<dyn Error>)?; // Convert any building errors

    // Since walker directly yields DirEntry objects, no need to match on Result
    for entry in walker.flatten() {
        println!("{}", entry.path().display());
    }

    Ok(())
}