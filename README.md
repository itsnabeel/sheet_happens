# SheetHappens

**SheetHappens** is a Ruby gem that allows you to easily generate reports from your ActiveRecord models. It supports multiple output formats, including HTML, CSV, JSON, and XLS.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sheet_happens'
```

Then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install sheet_happens
```

Sure, here's how you could modify the documentation to include that use case:

---

# Usage

## Direct Usage

You can directly use **SheetHappens** in any part of your code:

```ruby
report = SheetHappens::Report.new(Unit.all)
csv_data = report.to_csv

# You can directly send this data as a file:
send_data csv_data, filename: "unit_report_#{Time.zone.now.to_date}.csv"
```

This will generate a CSV report for all `Unit` records and send it as a downloadable file. The filename will be `"unit_report_<today's date>.csv"`.

## Custom Report Classes

If you want to customize the output of your reports, create a new report class in your `app/reports` directory that inherits from `SheetHappens::Report`.

For example:

```ruby
# app/reports/unit_report.rb
class UnitReport < SheetHappens::Report
  def format_name(value)
    value.reverse
  end
end
```

Then, in your controller or service object, you can use the report class like so:

```ruby
report = UnitReport.new(Unit.all)
csv_data = report.to_csv
```

In this example, the `UnitReport` class reverses the names of the units in the report.

---

This modified documentation includes an example of directly using `SheetHappens::Report` and also an example of using a custom report class. This should provide your users with a good starting point for using your gem in their own applications.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/your_github_username/sheet_happens](https://github.com/your_github_username/sheet_happens).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

---

Note that I've included placeholders for things like your GitHub username and the exact license you're using. You should replace these with the actual values you plan to use.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/sheet_happens. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/sheet_happens/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SheetHappens project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/sheet_happens/blob/main/CODE_OF_CONDUCT.md).
