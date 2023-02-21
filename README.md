# CSCI 181.03 - Layouting Sample

There are currently three available `UIViewController`s for testing right now:
- `RandomizingColorsTableViewController`
  - sdfsf
- `ProgrammaticTwitterViewController`
  - This is for exhibiting how to use a programmatically created `UITableViewCell` in a `UITableViewController`.
  - This contains code for differentiating between "pushing" and "presenting" `UIViewController`s.
  - This also contains code for showing how to reference /other/ storyboards.
  - `ProgrammaticTwitterTableViewCell` also differentiates between a programmatic `UIStackView` layouting approach versus a programmatic constraint-based layouting approach.
- `XibTwitterTableViewController`
  - This is for exhibiting how to use a `UITableViewCell` defined by a xib in a `UITableViewController`.
  - This also partially exhibits the layouting capabilities of `UIStackView`s.

By default, when you run the program, `RandomizingColorsTableViewController` will be the `UIViewController` that will be displayed.

---

To change this:
1. Go to Main.storyboard.
2. Click on the bar above the Table View. (Althernatively, you may also click the "Randomizing Colors Table View Controller Scene" on the View Hierarchy on the left.)
![Screenshot 2023-02-21 at 11 56 19 PM](https://user-images.githubusercontent.com/24354524/220395085-6aa847ca-99a5-4097-bcf2-c78966ee4948.png)
3. Navigate to the Identity Inspector on the right hand side of Xcode.
4. Then, change the custom class from `RandomizingColorsTableViewController` to the name of the `UIViewController` you want to test (e.g. ProgrammaticTwitterViewController, XibTwitterTableViewController).

