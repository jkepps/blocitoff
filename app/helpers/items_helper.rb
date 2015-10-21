module ItemsHelper
	def item_group_tag(item, &block)
		if item.complete
			content_tag :div, capture(&block), class: 'item row completed', id: "item-#{item.id}"
		else
			content_tag :div, capture(&block), class: 'item row', id: "item-#{item.id}"
		end
	end
end
