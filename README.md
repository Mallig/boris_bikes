## Boris Bikes

This program was written during the first week of Makers coding bootcamp, there were four focus goals to strive for while creating this program,
 - I write code that is easy to change
 - I can test-drive my code
 - I can build with objects
 - I know how my language works


Writing this has been my first experience creating a program through test driven development and pair programming. 

## Program Structure

There are two classes in this program, Bike and DockingStation. Bikes may be stored/released from Docking Stations and be reported as broken. Users interact with the program through ruby REPL

## Installing Boris Bikes

This program runs on `Ruby 2.5.1`, to run the program on your own machine ensure you are using the same ruby version.

clone the repository to your machine

```
$ git clone https://github.com/Mallig/boris_bikes.git
```

move into the repository and bundle install rspec if you want to run the tests

```
$ cd boris_bikes
$ bundle install
```

## Running Boris Bikes

Open up a ruby based REPL and require the docking_station.rb and bike.rb files

```
$ irb
> require './lib/bike'
> require './lib/docking_station'
```

New bikes and docking stations can be created and assigned to variables with the command 

```
> bike = Bike.new()
=> #<Bike:0x00007fde162132d8 @status=true>
> docking_station = DockingStation.new()
=> #<DockingStation:0x00007fde1621b4b0 @capacity=20, @working_bikes=[], @broken_bikes=[]>
```

The bike can then be stored and released from the docking station with 

```
> docking_station.dock(bike)
=> [#<Bike:0x00007fde162132d8 @status=true>]
> docking_station.release_bike()
=> #<Bike:0x00007fde162132d8 @status=true>
```

It is also possible to report a bike as broken, 

```
> bike.report()
=> "Bike reported as Broken"
```

Reported bikes can still be docked but will not be released.
note: if a user reports a bike after docking, the reported bike can be released.
