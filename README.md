# sinatra-dice-roll

[Notes for this project are located here.](https://learn.firstdraft.com/lessons/103)

Summary:

- Use the Sinatra package for deploying a minimal dynamic web page.
- Define paths to populate the web page.
- Use the backward slash symbol ("\\") to embed multiline html code within Ruby code:

```
get("/") do
  "
  <h1>Dice Roll</h1>
	
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
  </ul>
  "
end
```

- Alternatively, place html files named *.erb (embedded ruby) within the views folder. The views folder name is a predefined name. *.erb files no longer require the escape quotes. Load the *.erb file named elephant.erb on the ruby file as:

```
get("/") do
  erb(:elephant)
end
```

- To embed ruby codes within  a html code, enclose the code within <%= %>, e.g., <%= rand(100) %>.
- To pass variables from *.rb to *.erb code, precede the variable name in *.rb file with @, e.g., @outcome. In *.erbfile, enclose the variable name within <%= %>, e.g., <%= @outcome %>.   

- To simplify the coding efforts when having multiple pages that share very similar contents, use a master template called wrapper.erb and add an argument (or variable) to the erb method, as follows. The key :layout calls the ERB template.

```
erb(:two_six, { :layout => :wrapper })
```

- Note to add the <%= yield %> argument to the wrapper.erb tremplate to pass the additional contents that are unique to each die rolls (see below).

- By using the master template, each of the die pages contain only the unique contents. Only one copy of the shared content is needed, which resides within the wrapper.erb file. The duplicate code of the contents of the wrapper.erb within each of the die pages can be removed. 

- ANother advantage of placing the shared contents in one place (i.e., within wrapper.erb) is that any changes made within this one file is immediately reflected on the rest of the pages. 

```
<!-- /views/wrapper.erb -->

<!DOCTYPE html>
<html>
<head>
  <title>Dice Roll</title>
</head>

<body>
  <div>
    <div><a href="/">Home</a></div>
    <div><a href="/dice/2/6">2d6</a></div>
    <div><a href="/dice/2/10">2d10</a></div>
    <div><a href="/dice/1/20">1d20</a></div>
    <div><a href="/dice/5/4">4d5</a></div>
  </div>

  <%= yield %>
	
</body>
</html>
```
- Another simplification we can make is renaming wrapper.erb to layout.erb. By giving this wrapper file the default name, we no longer have to explicitly call the wrapper file by name. The command line erb(:five_four, { :layout => :wrapper }) can be replaced to simply just erb(:five_four).  

- Link to the model page (use http instead of https): <a href="http://dice-roll.matchthetarget.com/" target="_blank"> http://dice-roll.matchthetarget.com/ </a>  

- There is another variant of ERB tag for embedding Ruby codes into a html tag (i.e., <% %> without the equal sign), but without being displayed on the html page. In contrast, we would use the same tag with an equal sign to pass and display a variable from the ruby file. The variable name must be preceeded by the "@" sign, i.e., <%= @myvariable %>.

- In the example below, we use the silent ERB tag to embed ruby code, which is not displayed on the html page. We use the non-silent ERB tag as well to pass and display the ruby variables. 

```
<!-- /views/one_twenty.erb -->

<h1>1d20</h1>

<% if @die == 1 %>
  <p style="color: red"><%= @outcome %></p>
<% elsif @die == 20 %>
  <p style="color: green"><%= @outcome %></p>
<% else %>
  <p><%= @outcome %></p>
<% end %>
```

- If you just want to display a variable that is not being passed from the ruby file, you don't have to include the "@" sign. See below for an example. Here, <%= a_roll %> is not a passed variable. It is being generated within the erb code.

```
<!-- /views/one_hundred_six.erb -->

<h1>100d6</h1>

<ul>
  <% @rolls.each do |a_roll| %>
    <li>
      <%= a_roll %>
    </li>
  <% end %>
</ul>
```

- Modify the output into a list form, rather than string:

String form
```
  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
```

List form
```
  @outcome = 
  "<ul>
    <li>
    #{first_die}
    </li>
    <li>
    #{second_die}
    </li>
  </ul>
  "
```

- To simplify the above further, implement a do loop (see below). 

```
<h1>100d6</h1>

<ul>
  <% @rolls.each do |a_roll| %>
    <li>
      <%= a_roll %>
    </li>
  <% end %>
</ul>
```

- We pass an array called rolls for any number of sides die and for any number of rolls. We can therefore simplify the layout file even further by listing the results using the following universal iterator.

```
  <ul>
    <% @rolls.each do |a_roll| %>
      <li>
        <%= a_roll %>
      </li>
    <% end %>
  </ul>
```
