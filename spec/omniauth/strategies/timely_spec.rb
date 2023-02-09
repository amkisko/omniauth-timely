require 'spec_helper'

describe OmniAuth::Strategies::Timely do
  # NOTE https://dev.timelyapp.com/#authorization Accounts API section
  let(:raw_info) {
    [
      {
        "id": 4530,
        "name": "Timely",
        "color": "44505e",
        "currency": {
          "id": "usd",
          "name": "United States Dollar",
          "iso_code": "USD",
          "symbol": "$",
          "symbol_first": true
        },
        "logo": {
          "large_retina": "/assets/account_thumbs/account_large_retina-8bc212c450af14b3a0ea49098cdddbe4f90d5eb5fc57adfeade6ac1ad8fb1d4a.png",
          "medium_retina": "/assets/account_thumbs/account_medium_retina-10dfbcc6733ccba1d485971f63c5eb7f9b7ed1a942a0ebd140e292bcb1e4dbea.png",
          "small_retina": "/assets/account_thumbs/account_small_retina-ea5df153b4cd96fc801e2361afc7d1b06d7b95ce5c358250b81149e1a20689df.png",
          "brand_logo": false
        },
        "from": "Web",
        "max_users": 0,
        "seats": 1,
        "max_projects": 0,
        "plan_id": 4937,
        "plan_name": "Essential",
        "next_charge": "2022-09-07",
        "start_of_week": 0,
        "created_at": 1659893321,
        "payment_mode": "web",
        "paid": true,
        "company_size": "10-49",
        "plan_code": "essential",
        "plan_custom": false,
        "appstore_transaction_id": null,
        "owner_id": 10541,
        "weekly_user_capacity": 40.0,
        "default_work_days": "MON,TUE,WED,THU,FRI",
        "default_hour_rate": 0.0,
        "support_email": "support@timelyapp.com",
        "estimated_company_size": null,
        "industry": null,
        "memory_retention_days": 0,
        "num_users": 1,
        "num_projects": 0,
        "active_projects_count": 0,
        "total_projects_count": 0,
        "capacity": {
          "hours": 40,
          "minutes": 0,
          "seconds": 0.0,
          "formatted": "40:00",
          "total_hours": 40.0,
          "total_seconds": 144000.0,
          "total_minutes": 2400.0
        },
        "status": "active",
        "beta": false,
        "expired": false,
        "trial": false,
        "days_to_end_trial": 0,
        "features": [
          {
            "name": "control",
            "days": -1
          },
          {
            "name": "memories",
            "days": -1
          },
          {
            "name": "billing",
            "days": -1
          },
          {
            "name": "project_required_fields",
            "days": -1
          },
          {
            "name": "teams",
            "days": -1
          },
          {
            "name": "recurring_budget",
            "days": -1
          },
          {
            "name": "notifications_project_budget",
            "days": -1
          },
          {
            "name": "weekly_user_capacity",
            "days": -1
          },
          {
            "name": "company_view",
            "days": -1
          },
          {
            "name": "anomalies",
            "days": -1
          },
          {
            "name": "log_hours_for_others",
            "days": -1
          },
          {
            "name": "project_budget",
            "days": -1
          },
          {
            "name": "budgets_hourly_rates",
            "days": -1
          },
          {
            "name": "account_branding",
            "days": -1
          },
          {
            "name": "team_lead",
            "days": -1
          },
          {
            "name": "ai_timesheet_creation",
            "days": -1
          },
          {
            "name": "in_app_support",
            "days": -1
          },
          {
            "name": "people_dashboard",
            "days": -1
          },
          {
            "name": "people_notify",
            "days": -1
          },
          {
            "name": "premium_integrations",
            "days": -1
          },
          {
            "name": "individual_capacity",
            "days": -1
          },
          {
            "name": "audits",
            "days": -1
          },
          {
            "name": "project_dashboard",
            "days": -1
          },
          {
            "name": "high_level_reports",
            "days": -1
          },
          {
            "name": "live_reports",
            "days": -1
          },
          {
            "name": "invoices",
            "days": -1
          },
          {
            "name": "planned_entries",
            "days": -1
          },
          {
            "name": "internal_costs",
            "days": -1
          },
          {
            "name": "memory_retention",
            "days": -1
          },
          {
            "name": "tasks",
            "days": -1
          },
          {
            "name": "planning",
            "days": -1
          },
          {
            "name": "batch_log_planned_time",
            "days": -1
          }
        ]
      }
    ]
  }
  let(:dummy_rack_app) { [200, {}, ['dummy']] }
  let(:options) { {} }

  subject(:strategy) { OmniAuth::Strategies::Timely.new(dummy_rack_app, options) }

  describe 'options' do
    subject { strategy.options }

    it { expect(subject.name).to eq('timely') }
    it { expect(subject.client_options.site).to eq('https://api.timelyapp.com') }
    it { expect(subject.client_options.authorize_url).to eq('/1.1/oauth/authorize') }
    it { expect(subject.client_options.token_url).to eq('/1.1/oauth/token') }
  end

  describe '#info' do
    before do
      allow(strategy).to receive(:raw_info) { raw_info }
    end

    subject { strategy.info }

    it { expect(subject[0][:id]).to eq(1) }
    it { expect(subject[0][:name]).to eq('Timely') }
  end

  describe '#extra' do
    subject { strategy.extra }

    context 'skip_info enabled' do
      let(:options) { {skip_info: true} }

      before do
        allow(strategy).to receive(:raw_info) { raw_info }
      end

      it { expect(subject[:raw_info]).to be_nil }
    end

    context 'skip_info disabled' do
      before do
        allow(strategy).to receive(:raw_info) { raw_info }
      end

      it { expect(subject[:raw_info]).to eq(raw_info) }
    end
  end
end
