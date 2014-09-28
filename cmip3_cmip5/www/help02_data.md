### Working with Data

Returning to the data selection panel, how do we use it?

#### Variables

Several of the variables are categorical (climate models, emissions
scenarios, geographic locations, etc.). Some are discrete numerical
(months, years, decades). All of these serve in subsetting the two main
continuous numerical variables (temperature and precipitation) by way of
selecting factor levels and ranges, respectively. Going row by row,
first are the climate variables, temperature and precipitation. To the
right, units of measurement, metric selected by default. Next emissions
scenarios from CMIP3 and CMIP5, and below those, corresponding GCMs
which SNAP has downscaled over Alaska and Western Canada. Then there is
a checkbox for making composite models. If checked, the models chosen
are averaged together. Next is a slider allowing the user to restrict
the years of the data subset. Months and decades follow. Finally, in the
last row of inputs the user can choose a spatial scale on the left. On
the right, geographic locations propagate.

#### Data Requirements <img style="float: right" src="screenshots/dataSelectionPanel_1_white.png"/>

This brings us to a discussion of requirements. What can and can't be
done with the data selection? Geographic locations propagate based on
the spatial scale chosen. I have generally excluded the ability to make
comparison plots of multiple locations that span large differences in
spatial scale. You can expect they would look different, for example in
terms of variability, and this is not the purpose of the app.

Months and decades are the only two menus which can be left blank. In
all others, an empty menu means selections have not yet been made.
Because months and decades are factors with a number of levels, and
often all levels are selected, it is tedious to have to check (or
remove) them all. It also wastes space. For these two menus it is
assumed the user wants all levels *unless* they specify a subset. The
years of data actually returned by the app are represented by the
intersection of the years implied by the decades selection and the years
implied by the years slider. This allows the user to use whichever is
most convenient to restrict the data to the years they want. If you are
looking for specific, discontinuous decades, use the decades menu. This
is very common. Alternatively, albeit very unlikely, if you don't want a
full decade, cut into the ends of your decades selection with the years
slider.

Regarding scenarios and models, the user must select at least one
scenario and model from the same CMIP phase. For each of the models,
there are model outputs from each of three scenarios. The scenarios are
unique to each CMIP phase. Selecting only CMIP3 scenario(s) and CMIP5
model(s) or vice versa would return a data table with zero rows.
Although the app provides the ability to select scenarios and models
from both CMIP5 phases simultaneously and compare, this is not required.
The user may elect to select from and explore GCM outputs from only one
CMIP phase.

There are also sensible implicit restrictions when making a composite
model, though these are more decisively imposed by me and not by the
fact that it would generate an empty data table. When averaging GCMs
together, averaging will only occur within a CMIP phase. The user cannot
average CMIP3 models with CMIP5 models. If selecting only from one
phase, the user may average any set of models, up to all five that are
available.

The compositing does not average across scenarios if multiple scenarios
are selected. Selecting four models and two scenarios would result in
two four-model composite GCMs. However, if selecting models from both
CMIP3 and CMIP5, it is not enough that averaging between phases be
prohibited. It is also the case that the same number of individual GCMs
must constitute the composite models from each phase. The user cannot
make a composite model from two CMIP3 GCMs and another from five CMIP5
GCMs and then compare them when graphing. If the composite model
checkbox is checked and unequal numbers of models have been selected
from each CMIP phase, the averaging is simply ignored, which is evident
in the resulting data table.

#### Generating a Data Subset

In order to generate a data subset the user must fill in all selection
criteria at least minimally. This means at least one of the two climate
variables, at least one corresponding scenario-model pair from a single
CMIP phase, a valid date range, and at least one location. Although the
user may continue to select multiple climate variables, phases,
scenarios, models, months, years, and locations, as soon as the minimal
criteria are met, a `Subset Data` button will appear at the bottom left
corner of the data selection panel. It will not be made available if
insufficient information has been provided to generate a valid subset of
data.

When this button is pressed, the app subsets the original data table and
returns only what the user has requested. At this time a header of the
first several rows of the data table will display to the right
indicating successful completion. There is also a progress bar in the
upper right corner of the browser. Also at this time, now that the data
subset is available, the plot options panel appears below the data
selection panel. The data selection panel not being needed any longer,
automatically minimizes, and this makes more room for the plot options
panel and helps to keep it alongside the plot. The user can expand the
data selection panel and make changes to their data at any time.

#### Data Tables <img style="float: right" src="screenshots/dataTable_1_white.png"/>

The data tables do not offer much direct use. They are also not very
exciting when juxtaposed with aesthetically pleasing graphics that can
also be remade in novel, seemingly endless, ways. One could argue that
they are simply in the way. However, if you do a lot of quality control
on data, you will understand that there is much to be said for dumping a
little of it on the page and providing the option to query it directly.
I take some comfort in knowing that the plot I make is actually of the
data that I think it is, and that things are working as they should. It
would be bad to graph the wrong data subset due to a bug in the code.
Nothing in the plot really tells you that you have the right data.

#### Downloading Data

Once the `Subset Data` button is pressed, another element to appear is
the adjacent `Download Data` button. This allows the user to download
the data subset as a CSV file.