module Deployinator
  module Stacks
    module Xsellytics
      def xsellytics_environments
        [
            {
                :name            => "qa",
                :method          => deploy,
                :current_version => 'hi',
                :current_build   => 'current_qa_build',
                :next_build      => 'next_qa_build'
            },
            {
                :name            => "production",
                :method          => "prod_rsync",
                :current_version => xsellytics_production_version,
                :current_build   => 'current_prod_build',
                :next_build      => 'next_prod_build'
            }
        ]
      end

      def deploy
        "HI"
      end

      def xsellytics_production_version
        # %x{curl http://my-app.com/version.txt}
        "cf44aab-20110729-230910-UTC"
      end

      def xsellytics_head_build
        # the build version you're about to push
        # %x{git ls-remote #{your_git_repo_url} HEAD | cut -c1-7}.chomp
        "11666e3"
      end

      def xsellytics_production(options={})
        log_and_stream "Fill in the xsellytics_production method in stacks/xsellytics.rb!<br>"

        # log the deploy
        log_and_shout :old_build => environments[0][:current_build].call, :build => environments[0][:next_build].call
      end
    end
  end
end
