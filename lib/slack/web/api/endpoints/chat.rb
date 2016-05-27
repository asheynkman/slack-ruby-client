# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Chat
          #
          # This method deletes a message from a channel.
          #
          # @option options [timestamp] :ts
          #   Timestamp of the message to be deleted.
          # @option options [channel] :channel
          #   Channel containing the message to be deleted.
          # @option options [Object] :as_user
          #   Pass true to delete the message as the authed user. Bot users in this context are considered authed users.
          # @see https://api.slack.com/methods/chat.delete
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/chat/chat.delete.json
          def chat_delete(options = {})
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            post('chat.delete', options)
          end

          #
          # This method posts a message to a public channel, private channel, or direct message/IM channel.
          #
          # @option options [channel] :channel
          #   Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name. See below for more details.
          # @option options [Object] :text
          #   Text of the message to send. See below for an explanation of formatting. This field is usually required, unless you're providing only attachments instead.
          # @option options [Object] :parse
          #   Change how messages are treated. Defaults to none. See below.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames.
          # @option options [Object] :attachments
          #   Structured message attachments.
          # @option options [Object] :unfurl_links
          #   Pass true to enable unfurling of primarily text-based content.
          # @option options [Object] :unfurl_media
          #   Pass false to disable unfurling of media content.
          # @option options [Object] :username
          #   Set your bot's user name. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @option options [Object] :as_user
          #   Pass true to post the message as the authed user, instead of as a bot. Defaults to false. See authorship below.
          # @option options [Object] :icon_url
          #   URL to an image to use as the icon for this message. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @option options [Object] :icon_emoji
          #   emoji to use as the icon for this message. Overrides icon_url. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
          # @see https://api.slack.com/methods/chat.postMessage
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/chat/chat.postMessage.json
          def chat_postMessage(options = {})
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text or :attachments missing') if options[:text].nil? && options[:attachments].nil?
            # attachments must be passed as an encoded JSON string
            if options.key?(:attachments)
              attachments = options[:attachments]
              attachments = JSON.dump(attachments) unless attachments.is_a?(String)
              options = options.merge(attachments: attachments)
            end
            post('chat.postMessage', options)
          end

          #
          # This method updates a message in a channel. Though related to chat.postMessage, some parameters of chat.update are handled differently.
          #
          # @option options [timestamp] :ts
          #   Timestamp of the message to be updated.
          # @option options [channel] :channel
          #   Channel containing the message to be updated.
          # @option options [Object] :text
          #   New text for the message, using the default formatting rules.
          # @option options [Object] :attachments
          #   Structured message attachments.
          # @option options [Object] :parse
          #   Change how messages are treated. Defaults to client, unlike chat.postMessage. See below.
          # @option options [Object] :link_names
          #   Find and link channel names and usernames. Defaults to none. This parameter should be used in conjunction with parse. To set link_names to 1, specify a parse mode of full.
          # @option options [Object] :as_user
          #   Pass true to update the message as the authed user. Bot users in this context are considered authed users.
          # @see https://api.slack.com/methods/chat.update
          # @see https://github.com/dblock/slack-api-ref/blob/master/methods/chat/chat.update.json
          def chat_update(options = {})
            throw ArgumentError.new('Required arguments :ts missing') if options[:ts].nil?
            throw ArgumentError.new('Required arguments :channel missing') if options[:channel].nil?
            throw ArgumentError.new('Required arguments :text or :attachments missing') if options[:text].nil? && options[:attachments].nil?
            options = options.merge(channel: channels_id(options)['channel']['id']) if options[:channel]
            # attachments must be passed as an encoded JSON string
            if options.key?(:attachments)
              attachments = options[:attachments]
              attachments = JSON.dump(attachments) unless attachments.is_a?(String)
              options = options.merge(attachments: attachments)
            end
            post('chat.update', options)
          end
        end
      end
    end
  end
end
