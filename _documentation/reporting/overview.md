---
title: Overview
---

## Contents

In this document you can learn about:

* [Reports API Overview](#overview)
* [Features](#features)
* [Performance considerations when implementing the Reports API](#performance-considerations)
* [Products supported by Reports API](#products-supported)
* [Tutorial](#tutorial)
* [API Reference](#reference)

# Overview
Reports API allows to download call data records (CDRs). Records can be queried using a variety of parameters such as origin and destination phone numbers, status, time period, etc. (see report filters for more information). It is also possible to include the message body/text and to download reports for any of your subaccounts.

Use case examples:
* Customer billing - download your transactions and use the included price data to determine what to bill your customers
* Invoice reconciliation - compare your usage data with the invoice you have received
* Monitoring & analytics - Add CDR data to your business intelligence or analytics system to correlate it with other events

## Features
- Variety of filters - query exactly the data you need
- Concurrent requests - up to 5  per api key
- Compressed CSV - Reports are formatted as CSV and compressed for faster downloads
- Privacy - Report files are automatically deleted after 72 hours
- Callbacks - An HTTP(S) POST callback can be generated to notify when report is completed

## Performance considerations
* Report generation takes some time and therefore we recommend that you query less than 1 million records per request to ensure reasonable processing time.
* The Reports API is not suitable for real-time dashboards or monitoring because report generation can occasionally experience delays.

## Supported products
* SMS API
* Messages API
* Voice API
* Verify API
* Number Insight

## API Reference

* [Reports API Reference](/api/reports)

## Tutorial
* [How to generate a report via Postman for non-technical users](link to be added when available)
