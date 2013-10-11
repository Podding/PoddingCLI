# encoding: utf-8

# Provide methods to deal with episodes

HEADER_ORDER = {
  name: 1,
  title: 2,
  date: 3,
  status: 4
}

def sort_meta_with_order(meta, order)
  sorted = meta.sort do |one, two|
    return order[one] <=> order[two] if order[one] && order[two]
    return -1 if order[one] && order[two] == nil
    return 1 if order[two] && order[one] == nil
    0
  end
  Hash[sorted]
end

def sort_meta(meta)
  sort_meta_with_order(meta, HEADER_ORDER)
end