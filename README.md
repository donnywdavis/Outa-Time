# Homework 03

## OutaTime

![Great Scott!](http://weknowmemes.com/wp-content/uploads/2011/10/great-scott-doc-back-to-the-future-drawing.jpg)

Great Scott!

The DeLorean's time circuits have been damaged! I bet Biff was in there messing around. In order to get you back to your own time, we'll need to build a new set of time circuits and rig them up to the DeLorean. I think that pocket computer you showed me earlier will do nicely. If you can build a program with an interface for the time circuits, I can give you the mathematical formulas that make time travel possible. All you have to do is enter them into your pocket computer and you'll be on your way back to the future!

Time is a factor here. We've only got 24 hours until lightning is due to strike the clock tower to provide the DeLorean with the 1.21 gigawatts of power needed to activate the time circuits. You've got to get the program built and your pocket computer rigged to the DeLorean before then.

If my calculations are correct, when this baby hits 88 miles per hour... you're gonna see some serious shit.

\- Doc Brown

### Steps to Success

#### Storyboard Tasks

* [x] The time circuits view should be embedded in a navigation controller
* [ ] All label groups should be centered horizontally and 20 points apart. The actual readout labels should also use the custom font "digital-7".
	* [x] Below the labels for the destination time, there should be a set of labels for "present time"
		* [x] Choose a lime green/yellow color for this label
	* [x] Below the present time labels, there should be a set for "last time departed"
		* [x] Choose an orange color for this label
* [X] Also centered horizontally and 20 pts below the time labels, there should be a "CURRENT SPEED" label group. The second label that displays the speed should read "0 MPH"
	* [X] The actual speed label should be red in color
* [X] All relevant labels need to be wired to their associated properties

* [ ] Below all the labels, there should be 2 buttons, also centered horizontally and spaced 20 pts apart from both the other labels and each other
	* [x] These buttons should be named "SET DESTINATION TIME" and "TRAVEL BACK"
	* [x] The buttons should both be teal in color
	* [x] These buttons should be wired to their appropriate IBActions or segues
		* [x] The segue for SET DESTINATION TIME should have an identifier of "ShowDestinationDatePickerSegue"

* [x] The the date picker view contains a date picker. This UI object should be centered both horizontally and vertically in the view. Its leading and trailing space should also hug the left and right edges of its superview.
* [x] The the date picker view should be have a custom class of "DatePickerViewController"
* [x] The date picker should be wired up to its associated property

#### Code Tasks

* [x] 1. Add variables.
* [x] 2. Set the title.
* [x] 3. Initialize the date formatter.
* [x] 4. Set the date formatter's date format.
* [x] 5. Set the presentTimeLabel to the current date using the date formatter.
* [x] 6. Set the current speed variable to 0.
* [x] 7. Set the speed label to "% MPH", with % being the current speed.
* [x] 8. Set the lastTimeDeparted label.
* [x] 9. Set the TimeCircuitsViewController class as implementing the delegate for the date picker.
* [x] 10. Set the DatePickerViewController object's delegate as the TimeCircuitsViewController object.
* [x] 11. Call the delegate method to inform the delegate of the new date chosen by the user.
* [x] 12. Set the destinationTimeLabel with the date received from the picker view controller using the date formatter object.
* [x] 13. Call the method to start the timer.
* [x] 14. Check to see if the timer object is nil. There is a shorthand for that.
* [x] 15. Instantiate the timer object for a 0.1 sec time interval. Set it to fire the method that updates the speed label.
* [x] 16. Stop the timer and set it to nil.
* [x] 17. Check if the current speed variable has reached 88. We want to execute the block inside the if if we HAVEN'T reached 88.
* [x] 18. Increment the current speed variable by 1.
* [x] 19. Update the speed label with the current speed.
* [x] 20. Since the speed has reached at least 88, stop the timer.
* [x] 21. Update the value of the lastTimeDepartedLabel with the value from the presentTimeLabel.
* [x] 22. Update the value of the presentTimeLabel with the value from the destinationTimeLabel.
* [x] 23. Reset the value of the current speed variable to 0.
