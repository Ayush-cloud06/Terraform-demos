# -- 'Few' of the common built-in functions in Terraform, 

// i covered the following functions from claude sonnet, There are lot more functions available :)


locals {
  # String Functions
  string_upper  = upper("hello world")                       # Converts a string to uppercase.
  string_lower  = lower("TERRAFORM")                         # Converts a string to lowercase.
  string_join   = join("-", ["a", "b", "c"])                 # Joins list elements into a single string with a delimiter.
  string_split  = split(",", "one,two,three")                # Splits a string by a delimiter into a list.
  string_format = format("User %s has ID %d.", "Alice", 101) # Formats a string according to a spec.

  # Collection Functions
  example_list = ["Linux", "AWS", "terraform"]
  example_map = {
    name = "Ayush"
    role = "Architect"
  }
  list_length   = length(local.example_list)                 # Returns the number of elements in a list, map, or string.
  list_element  = element(local.example_list, 1)             # Returns an element from a list at a given index.
  map_keys      = keys(local.example_map)                    # Returns a list of the keys from a map.
  map_lookup    = lookup(local.example_map, "role", "Guest") # Retrieves a value from a map, with a default if the key is missing.
  list_contains = contains(local.example_list, "banana")     # Checks if a list contains a given element.

  # Numeric Functions
  numeric_max = max(15, 8, 22) # Returns the greatest of the given numbers. 
  numeric_min = min(15, 8, 22) # Returns the smallest of the given numbers.


}

output "string_functions" {
  description = "Demonstrates string manipulation functions."
  value = {
    upper  = local.string_upper
    lower  = local.string_lower
    join   = local.string_join
    split  = local.string_split
    format = local.string_format
  }
}

output "collection_functions" {
  description = "Demonstrates list and map functions."
  value = {
    list_length   = local.list_length
    list_element  = local.list_element
    map_keys      = local.map_keys
    map_lookup    = local.map_lookup
    list_contains = local.list_contains
  }
}

output "numeric_functions" {
  description = "Demonstrates numeric functions."
  value = {
    max = local.numeric_max
    min = local.numeric_min
  }
}


