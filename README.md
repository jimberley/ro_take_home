# ro_take_home
A repo for the take-home exam for RO

# Explanation
This is a simplified structure of an RSpec/Capybara framework for testing RO's new-patient landing for `/Rory`

The files are a `spec` file, a `page_objects` folder, an individual `page_object` for the landing page, and a `test_helper` file.

The `spec` is abstracted via the `page_object` wherein individual methods and elements are listed (using `site_prism` gem) in a manner allowing for their use in plain-language within the test. (e.g. `page.find('#header').visible?` becomes `@page.header.visible?` in the test. This abstraction allows for single-place corrections in the event that a given object's ID/Locator changes in code or is removed.

# The Test Plan
[This is a very simplified test plan](https://docs.google.com/spreadsheets/d/1rkeN-vHmLcSVqkDQWhvpz06dOd0rLRvzaz6lf_RzfVk/edit?usp=sharing) which focused primarily on exploring mission-critical paths listed in a programmatic way including P-value (P0 = if it broke on Prod, we'd fix it ASAP, etc.), Steps to produce the test, acceptance criteria, and Notes. This is the manner in which I typically formulate formal test plans.

Give the sensitive nature of the flow in question, many of the individual elements qualify as being highest priority for the business. There are so many points at which the user could get "stuck" or be forcibly ejected from the flow that getting to the payment information (arguably the most important part of the flow to the business) needs to be absurdly smooth. As a result, many of the flows here are `P0`.

I've opted not to include test steps for all of these save one as I believe that showing one adequately displays my understanding of test flows and I opted to reserve my time for tis assignment for creating the miniature test rig. 

# Some Notes
- Selecting "Male" in Sex Selection for a Female-Only Product Results in the user being kicked out of the flow entirely.	This should probably spit out a warning only and just not allow submission of the form. It's bad UX.
- The "support" and "help" buttons don't seem to do anything	
- Eveyrthing needs ID.	The current implementation of the site is not very friendly for UI automation
