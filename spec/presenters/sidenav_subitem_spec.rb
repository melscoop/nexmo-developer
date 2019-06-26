require 'rails_helper'

RSpec.describe SidenavSubitem do

  let(:folder) do
    { title: 'overview.md', path: '_documentation/en/concepts/overview.md', is_file?: true }
  end

  let(:sidenav) do
    instance_double(
      Sidenav,
      navigation: :documentation,
      request_path: '/en/concepts/overview',
      documentation?: true,
    )
  end

  subject { described_class.new(folder: folder, sidenav: sidenav) }

  describe '#title' do
    it 'delegates the title generation to TitleNormalizer' do
      expect(TitleNormalizer).to receive(:call).with(folder)
      subject.title
    end
  end

  describe '#file?' do
    it { expect(subject.file?).to eq(true) }
  end

  describe '#collapsible?' do
    it '' do
      expect(subject.collapsible?).to eq(true)
    end
  end

  describe '#url' do
    context 'for a document' do
      it { expect(subject.url).to eq('/en/concepts/overview') }
    end

    context 'otherwise' do
      let(:folder) do
        { title: 'beta.md', path: 'app/views/product-lifecycle/beta.md', is_file?: true }
      end

      let(:sidenav) do
        instance_double(
          Sidenav,
          navigation: :documentation,
          request_path: '/product-lifecycle/dev-preview',
          documentation?: false,
        )
      end

      it { expect(subject.url).to eq('/product-lifecycle/beta') }
    end
  end

  describe '#active?' do
    it { expect(subject.active?).to eq(true) }
  end

  describe '#link_css_class' do
    it { expect(subject.link_css_class).to eq('Vlt-sidemenu__link_active') }
  end
end
