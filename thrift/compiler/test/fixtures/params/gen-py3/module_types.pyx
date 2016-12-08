#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from cython.operator cimport dereference as deref, preincrement as inc
from thrift.lib.py3.thrift_server cimport TException
cimport std_libcpp

from collections.abc import Sequence, Set, Mapping, Iterable
from enum import Enum




cdef class List__i32:
    def __init__(self, items=None):
        if isinstance(items, List__i32):
            self._vector = (<List__i32> items)._vector
        else:
          self._vector = make_shared[vector[int32_t]]()
          if items:
              for item in items:
                  deref(self._vector).push_back(item)

    @staticmethod
    cdef create(
            shared_ptr[vector[int32_t]] c_items):
        inst = <List__i32>List__i32.__new__(List__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef int32_t citem = (
            deref(self._vector.get())[index])
        return citem

    def __len__(self):
        return deref(self._vector).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple(self))

    def __contains__(self, item):
        cdef int32_t citem = item
        cdef vector[int32_t] vec = deref(
            self._vector.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        cdef int32_t citem
        for citem in deref(self._vector):
            yield citem

    def __reversed__(self):
        cdef int32_t citem
        cdef vector[int32_t] vec = deref(
            self._vector.get())
        cdef vector[int32_t].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield citem
            inc(loc)

    def index(self, item):
        cdef int32_t citem = item
        cdef vector[int32_t] vec = deref(self._vector.get())
        cdef vector[int32_t].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError("{} is not in list".format(item))

    def count(self, item):
        cdef int32_t citem = item
        cdef vector[int32_t] vec = deref(self._vector.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__i32)

cdef class Map__i32_List__i32:
    def __init__(self, items=None):
        if isinstance(items, Map__i32_List__i32):
            self._map = (<Map__i32_List__i32> items)._map
        else:
          self._map = make_shared[cmap[int32_t,vector[int32_t]]]()
          if items:
              for key, item in items.items():
                  deref(self._map).insert(
                      cpair[int32_t,vector[int32_t]](
                          key,
                          deref(List__i32(item)._vector.get())))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,vector[int32_t]]] c_items):
        inst = <Map__i32_List__i32>Map__i32_List__i32.__new__(Map__i32_List__i32)
        inst._map = c_items
        return inst

    def __getitem__(self, key):
        cdef int32_t ckey = key
        cdef cmap[int32_t,vector[int32_t]].iterator iter = deref(
            self._map).find(ckey)
        if iter == deref(self._map).end():
            raise KeyError(str(key))
        cdef vector[int32_t] citem = deref(iter).second
        return List__i32.create(
    make_shared[vector[int32_t]](citem))

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Mapping) and isinstance(other, Mapping)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for key in self:
            if key not in other:
                return cop != 2
            if other[key] != self[key]:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple((tuple(self), tuple(self[k] for k in self))))

    def __contains__(self, key):
        cdef int32_t ckey = key
        return deref(self._map).count(ckey) > 0

    def get(self, key, default=None):
        cdef int32_t ckey = key
        cdef cmap[int32_t,vector[int32_t]].iterator iter = \
            deref(self._map).find(ckey)
        if iter == deref(self._map).end():
            return default
        cdef vector[int32_t] citem = deref(iter).second
        return List__i32.create(
    make_shared[vector[int32_t]](citem))

    def keys(self):
        return self.__iter__()

    def values(self):
        cdef vector[int32_t] citem
        for pair in deref(self._map):
            citem = pair.second
            yield List__i32.create(
    make_shared[vector[int32_t]](citem))

    def items(self):
        cdef int32_t ckey
        cdef vector[int32_t] citem
        for pair in deref(self._map):
            ckey = pair.first
            citem = pair.second

            yield (ckey, List__i32.create(
    make_shared[vector[int32_t]](citem)))



Mapping.register(Map__i32_List__i32)

cdef class Set__i32:
    def __init__(self, items=None):
        if isinstance(items, Set__i32):
            self._set = (<Set__i32> items)._set
        else:
          self._set = make_shared[cset[int32_t]]()
          if items:
              for item in items:
                  deref(self._set).insert(item)

    @staticmethod
    cdef create(shared_ptr[cset[int32_t]] c_items):
        inst = <Set__i32>Set__i32.__new__(Set__i32)
        inst._set = c_items
        return inst

    def __contains__(self, item):
        return pbool(deref(self._set).count(item))

    def __len__(self):
        return deref(self._set).size()

    def __iter__(self):
        for citem in deref(self._set):
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        cdef cset[int32_t] cself, cother
        cdef cbool retval
        if (isinstance(self, Set__i32) and
                isinstance(other, Set__i32)):
            cself = deref((<Set__i32> self)._set)
            cother = deref((<Set__i32> other)._set)
            # C level comparisons
            if cop == 0:    # Less Than (strict subset)
                if not cself.size() < cother.size():
                    return False
                for item in cself:
                    if not cother.count(item):
                        return False
                return True
            elif cop == 1:  # Less Than or Equal To  (subset)
                for item in cself:
                    if not cother.count(item):
                        return False
                return True
            elif cop == 2:  # Equivalent
                if cself.size() != cother.size():
                    return False
                for item in cself:
                    if not cother.count(item):
                        return False
                return True
            elif cop == 3:  # Not Equivalent
                for item in cself:
                    if not cother.count(item):
                        return True
                return cself.size() != cother.size()
            elif cop == 4:  # Greater Than (strict superset)
                if not cself.size() > cother.size():
                    return False
                for item in cother:
                    if not cself.count(item):
                        return False
                return True
            elif cop == 5:  # Greater Than or Equal To (superset)
                for item in cother:
                    if not cself.count(item):
                        return False
                return True

        # Python level comparisons
        if cop == 0:
            return Set.__lt__(self, other)
        elif cop == 1:
            return Set.__le__(self, other)
        elif cop == 2:
            return Set.__eq__(self, other)
        elif cop == 3:
            return Set.__ne__(self, other)
        elif cop == 4:
            return Set.__gt__(self, other)
        elif cop == 5:
            return Set.__ge__(self, other)

    def __hash__(self):
        return hash(tuple(self))

    def __and__(self, other):
        if not isinstance(self, Set__i32):
            self = Set__i32(self)
        if not isinstance(other, Set__i32):
            other = Set__i32(other)

        cdef shared_ptr[cset[int32_t]] shretval = \
            make_shared[cset[int32_t]]()
        for citem in deref((<Set__i32> self)._set):
            if deref((<Set__i32> other)._set).count(citem) > 0:
                deref(shretval).insert(citem)
        return Set__i32.create(shretval)

    def __sub__(self, other):
        if not isinstance(self, Set__i32):
            self = Set__i32(self)
        if not isinstance(other, Set__i32):
            other = Set__i32(other)

        cdef shared_ptr[cset[int32_t]] shretval = \
            make_shared[cset[int32_t]]()
        for citem in deref((<Set__i32> self)._set):
            if deref((<Set__i32> other)._set).count(citem) == 0:
                deref(shretval).insert(citem)
        return Set__i32.create(shretval)

    def __or__(self, other):
        if not isinstance(self, Set__i32):
            self = Set__i32(self)
        if not isinstance(other, Set__i32):
            other = Set__i32(other)

        cdef shared_ptr[cset[int32_t]] shretval = \
            make_shared[cset[int32_t]]()
        for citem in deref((<Set__i32> self)._set):
                deref(shretval).insert(citem)
        for citem in deref((<Set__i32> other)._set):
                deref(shretval).insert(citem)
        return Set__i32.create(shretval)

    def __xor__(self, other):
        if not isinstance(self, Set__i32):
            self = Set__i32(self)
        if not isinstance(other, Set__i32):
            other = Set__i32(other)

        cdef shared_ptr[cset[int32_t]] shretval = \
            make_shared[cset[int32_t]]()
        for citem in deref((<Set__i32> self)._set):
            if deref((<Set__i32> other)._set).count(citem) == 0:
                deref(shretval).insert(citem)
        for citem in deref((<Set__i32> other)._set):
            if deref((<Set__i32> self)._set).count(citem) == 0:
                deref(shretval).insert(citem)
        return Set__i32.create(shretval)

    def isdisjoint(self, other):
        return len(self & other) == 0

    def union(self, other):
        return self | other

    def intersection(self, other):
        return self & other

    def difference(self, other):
        return self - other

    def symmetric_difference(self, other):
        return self ^ other

    def issubset(self, other):
        return self <= other

    def issuperset(self, other):
        return self >= other



Set.register(Set__i32)

cdef class Map__i32_Set__i32:
    def __init__(self, items=None):
        if isinstance(items, Map__i32_Set__i32):
            self._map = (<Map__i32_Set__i32> items)._map
        else:
          self._map = make_shared[cmap[int32_t,cset[int32_t]]]()
          if items:
              for key, item in items.items():
                  deref(self._map).insert(
                      cpair[int32_t,cset[int32_t]](
                          key,
                          cset[int32_t](deref(Set__i32(item)._set.get()))))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,cset[int32_t]]] c_items):
        inst = <Map__i32_Set__i32>Map__i32_Set__i32.__new__(Map__i32_Set__i32)
        inst._map = c_items
        return inst

    def __getitem__(self, key):
        cdef int32_t ckey = key
        cdef cmap[int32_t,cset[int32_t]].iterator iter = deref(
            self._map).find(ckey)
        if iter == deref(self._map).end():
            raise KeyError(str(key))
        cdef cset[int32_t] citem = deref(iter).second
        return Set__i32.create(
    make_shared[cset[int32_t]](citem))

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Mapping) and isinstance(other, Mapping)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for key in self:
            if key not in other:
                return cop != 2
            if other[key] != self[key]:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple((tuple(self), tuple(self[k] for k in self))))

    def __contains__(self, key):
        cdef int32_t ckey = key
        return deref(self._map).count(ckey) > 0

    def get(self, key, default=None):
        cdef int32_t ckey = key
        cdef cmap[int32_t,cset[int32_t]].iterator iter = \
            deref(self._map).find(ckey)
        if iter == deref(self._map).end():
            return default
        cdef cset[int32_t] citem = deref(iter).second
        return Set__i32.create(
    make_shared[cset[int32_t]](citem))

    def keys(self):
        return self.__iter__()

    def values(self):
        cdef cset[int32_t] citem
        for pair in deref(self._map):
            citem = pair.second
            yield Set__i32.create(
    make_shared[cset[int32_t]](citem))

    def items(self):
        cdef int32_t ckey
        cdef cset[int32_t] citem
        for pair in deref(self._map):
            ckey = pair.first
            citem = pair.second

            yield (ckey, Set__i32.create(
    make_shared[cset[int32_t]](citem)))



Mapping.register(Map__i32_Set__i32)

cdef class Map__i32_i32:
    def __init__(self, items=None):
        if isinstance(items, Map__i32_i32):
            self._map = (<Map__i32_i32> items)._map
        else:
          self._map = make_shared[cmap[int32_t,int32_t]]()
          if items:
              for key, item in items.items():
                  deref(self._map).insert(
                      cpair[int32_t,int32_t](
                          key,
                          item))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,int32_t]] c_items):
        inst = <Map__i32_i32>Map__i32_i32.__new__(Map__i32_i32)
        inst._map = c_items
        return inst

    def __getitem__(self, key):
        cdef int32_t ckey = key
        cdef cmap[int32_t,int32_t].iterator iter = deref(
            self._map).find(ckey)
        if iter == deref(self._map).end():
            raise KeyError(str(key))
        cdef int32_t citem = deref(iter).second
        return citem

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Mapping) and isinstance(other, Mapping)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for key in self:
            if key not in other:
                return cop != 2
            if other[key] != self[key]:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple((tuple(self), tuple(self[k] for k in self))))

    def __contains__(self, key):
        cdef int32_t ckey = key
        return deref(self._map).count(ckey) > 0

    def get(self, key, default=None):
        cdef int32_t ckey = key
        cdef cmap[int32_t,int32_t].iterator iter = \
            deref(self._map).find(ckey)
        if iter == deref(self._map).end():
            return default
        cdef int32_t citem = deref(iter).second
        return citem

    def keys(self):
        return self.__iter__()

    def values(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.second
            yield citem

    def items(self):
        cdef int32_t ckey
        cdef int32_t citem
        for pair in deref(self._map):
            ckey = pair.first
            citem = pair.second

            yield (ckey, citem)



Mapping.register(Map__i32_i32)

cdef class List__Map__i32_i32:
    def __init__(self, items=None):
        if isinstance(items, List__Map__i32_i32):
            self._vector = (<List__Map__i32_i32> items)._vector
        else:
          self._vector = make_shared[vector[cmap[int32_t,int32_t]]]()
          if items:
              for item in items:
                  deref(self._vector).push_back(cmap[int32_t,int32_t](deref(Map__i32_i32(item)._map.get())))

    @staticmethod
    cdef create(
            shared_ptr[vector[cmap[int32_t,int32_t]]] c_items):
        inst = <List__Map__i32_i32>List__Map__i32_i32.__new__(List__Map__i32_i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef cmap[int32_t,int32_t] citem = (
            deref(self._vector.get())[index])
        return Map__i32_i32.create(
    make_shared[cmap[int32_t,int32_t]](citem))

    def __len__(self):
        return deref(self._vector).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple(self))

    def __contains__(self, item):
        cdef cmap[int32_t,int32_t] citem = cmap[int32_t,int32_t](deref(Map__i32_i32(item)._map.get()))
        cdef vector[cmap[int32_t,int32_t]] vec = deref(
            self._vector.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        cdef cmap[int32_t,int32_t] citem
        for citem in deref(self._vector):
            yield Map__i32_i32.create(
    make_shared[cmap[int32_t,int32_t]](citem))

    def __reversed__(self):
        cdef cmap[int32_t,int32_t] citem
        cdef vector[cmap[int32_t,int32_t]] vec = deref(
            self._vector.get())
        cdef vector[cmap[int32_t,int32_t]].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield Map__i32_i32.create(
    make_shared[cmap[int32_t,int32_t]](citem))
            inc(loc)

    def index(self, item):
        cdef cmap[int32_t,int32_t] citem = cmap[int32_t,int32_t](deref(Map__i32_i32(item)._map.get()))
        cdef vector[cmap[int32_t,int32_t]] vec = deref(self._vector.get())
        cdef vector[cmap[int32_t,int32_t]].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError("{} is not in list".format(item))

    def count(self, item):
        cdef cmap[int32_t,int32_t] citem = cmap[int32_t,int32_t](deref(Map__i32_i32(item)._map.get()))
        cdef vector[cmap[int32_t,int32_t]] vec = deref(self._vector.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__Map__i32_i32)

cdef class List__Set__i32:
    def __init__(self, items=None):
        if isinstance(items, List__Set__i32):
            self._vector = (<List__Set__i32> items)._vector
        else:
          self._vector = make_shared[vector[cset[int32_t]]]()
          if items:
              for item in items:
                  deref(self._vector).push_back(cset[int32_t](deref(Set__i32(item)._set.get())))

    @staticmethod
    cdef create(
            shared_ptr[vector[cset[int32_t]]] c_items):
        inst = <List__Set__i32>List__Set__i32.__new__(List__Set__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef cset[int32_t] citem = (
            deref(self._vector.get())[index])
        return Set__i32.create(
    make_shared[cset[int32_t]](citem))

    def __len__(self):
        return deref(self._vector).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple(self))

    def __contains__(self, item):
        cdef cset[int32_t] citem = cset[int32_t](deref(Set__i32(item)._set.get()))
        cdef vector[cset[int32_t]] vec = deref(
            self._vector.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        cdef cset[int32_t] citem
        for citem in deref(self._vector):
            yield Set__i32.create(
    make_shared[cset[int32_t]](citem))

    def __reversed__(self):
        cdef cset[int32_t] citem
        cdef vector[cset[int32_t]] vec = deref(
            self._vector.get())
        cdef vector[cset[int32_t]].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield Set__i32.create(
    make_shared[cset[int32_t]](citem))
            inc(loc)

    def index(self, item):
        cdef cset[int32_t] citem = cset[int32_t](deref(Set__i32(item)._set.get()))
        cdef vector[cset[int32_t]] vec = deref(self._vector.get())
        cdef vector[cset[int32_t]].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError("{} is not in list".format(item))

    def count(self, item):
        cdef cset[int32_t] citem = cset[int32_t](deref(Set__i32(item)._set.get()))
        cdef vector[cset[int32_t]] vec = deref(self._vector.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__Set__i32)

cdef class Map__i32_Map__i32_Set__i32:
    def __init__(self, items=None):
        if isinstance(items, Map__i32_Map__i32_Set__i32):
            self._map = (<Map__i32_Map__i32_Set__i32> items)._map
        else:
          self._map = make_shared[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]()
          if items:
              for key, item in items.items():
                  deref(self._map).insert(
                      cpair[int32_t,cmap[int32_t,cset[int32_t]]](
                          key,
                          cmap[int32_t,cset[int32_t]](deref(Map__i32_Set__i32(item)._map.get()))))

    @staticmethod
    cdef create(shared_ptr[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] c_items):
        inst = <Map__i32_Map__i32_Set__i32>Map__i32_Map__i32_Set__i32.__new__(Map__i32_Map__i32_Set__i32)
        inst._map = c_items
        return inst

    def __getitem__(self, key):
        cdef int32_t ckey = key
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]].iterator iter = deref(
            self._map).find(ckey)
        if iter == deref(self._map).end():
            raise KeyError(str(key))
        cdef cmap[int32_t,cset[int32_t]] citem = deref(iter).second
        return Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cset[int32_t]]](citem))

    def __len__(self):
        return deref(self._map).size()

    def __iter__(self):
        cdef int32_t citem
        for pair in deref(self._map):
            citem = pair.first
            yield citem

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Mapping) and isinstance(other, Mapping)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for key in self:
            if key not in other:
                return cop != 2
            if other[key] != self[key]:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple((tuple(self), tuple(self[k] for k in self))))

    def __contains__(self, key):
        cdef int32_t ckey = key
        return deref(self._map).count(ckey) > 0

    def get(self, key, default=None):
        cdef int32_t ckey = key
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]].iterator iter = \
            deref(self._map).find(ckey)
        if iter == deref(self._map).end():
            return default
        cdef cmap[int32_t,cset[int32_t]] citem = deref(iter).second
        return Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cset[int32_t]]](citem))

    def keys(self):
        return self.__iter__()

    def values(self):
        cdef cmap[int32_t,cset[int32_t]] citem
        for pair in deref(self._map):
            citem = pair.second
            yield Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cset[int32_t]]](citem))

    def items(self):
        cdef int32_t ckey
        cdef cmap[int32_t,cset[int32_t]] citem
        for pair in deref(self._map):
            ckey = pair.first
            citem = pair.second

            yield (ckey, Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cset[int32_t]]](citem)))



Mapping.register(Map__i32_Map__i32_Set__i32)

cdef class List__Map__i32_Map__i32_Set__i32:
    def __init__(self, items=None):
        if isinstance(items, List__Map__i32_Map__i32_Set__i32):
            self._vector = (<List__Map__i32_Map__i32_Set__i32> items)._vector
        else:
          self._vector = make_shared[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]]()
          if items:
              for item in items:
                  deref(self._vector).push_back(cmap[int32_t,cmap[int32_t,cset[int32_t]]](deref(Map__i32_Map__i32_Set__i32(item)._map.get())))

    @staticmethod
    cdef create(
            shared_ptr[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]] c_items):
        inst = <List__Map__i32_Map__i32_Set__i32>List__Map__i32_Map__i32_Set__i32.__new__(List__Map__i32_Map__i32_Set__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem = (
            deref(self._vector.get())[index])
        return Map__i32_Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cmap[int32_t,cset[int32_t]]]](citem))

    def __len__(self):
        return deref(self._vector).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple(self))

    def __contains__(self, item):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem = cmap[int32_t,cmap[int32_t,cset[int32_t]]](deref(Map__i32_Map__i32_Set__i32(item)._map.get()))
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] vec = deref(
            self._vector.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem
        for citem in deref(self._vector):
            yield Map__i32_Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cmap[int32_t,cset[int32_t]]]](citem))

    def __reversed__(self):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] vec = deref(
            self._vector.get())
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield Map__i32_Map__i32_Set__i32.create(
    make_shared[cmap[int32_t,cmap[int32_t,cset[int32_t]]]](citem))
            inc(loc)

    def index(self, item):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem = cmap[int32_t,cmap[int32_t,cset[int32_t]]](deref(Map__i32_Map__i32_Set__i32(item)._map.get()))
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] vec = deref(self._vector.get())
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError("{} is not in list".format(item))

    def count(self, item):
        cdef cmap[int32_t,cmap[int32_t,cset[int32_t]]] citem = cmap[int32_t,cmap[int32_t,cset[int32_t]]](deref(Map__i32_Map__i32_Set__i32(item)._map.get()))
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] vec = deref(self._vector.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__Map__i32_Map__i32_Set__i32)

cdef class List__List__Map__i32_Map__i32_Set__i32:
    def __init__(self, items=None):
        if isinstance(items, List__List__Map__i32_Map__i32_Set__i32):
            self._vector = (<List__List__Map__i32_Map__i32_Set__i32> items)._vector
        else:
          self._vector = make_shared[vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]]]()
          if items:
              for item in items:
                  deref(self._vector).push_back(deref(List__Map__i32_Map__i32_Set__i32(item)._vector.get()))

    @staticmethod
    cdef create(
            shared_ptr[vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]]] c_items):
        inst = <List__List__Map__i32_Map__i32_Set__i32>List__List__Map__i32_Map__i32_Set__i32.__new__(List__List__Map__i32_Map__i32_Set__i32)
        inst._vector = c_items
        return inst

    def __getitem__(self, int index):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem = (
            deref(self._vector.get())[index])
        return List__Map__i32_Map__i32_Set__i32.create(
    make_shared[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]](citem))

    def __len__(self):
        return deref(self._vector).size()

    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(type(self), type(other)))
        if not (isinstance(self, Iterable) and isinstance(other, Iterable)):
            return cop != 2
        if (len(self) != len(other)):
            return cop != 2

        for one, two in zip(self, other):
            if one != two:
                return cop != 2

        return cop == 2

    def __hash__(self):
        return hash(tuple(self))

    def __contains__(self, item):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem = deref(List__Map__i32_Map__i32_Set__i32(item)._vector.get())
        cdef vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]] vec = deref(
            self._vector.get())
        return std_libcpp.find(vec.begin(), vec.end(), citem) != vec.end()

    def __iter__(self):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem
        for citem in deref(self._vector):
            yield List__Map__i32_Map__i32_Set__i32.create(
    make_shared[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]](citem))

    def __reversed__(self):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem
        cdef vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]] vec = deref(
            self._vector.get())
        cdef vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]].reverse_iterator loc = vec.rbegin()
        while loc != vec.rend():
            citem = deref(loc)
            yield List__Map__i32_Map__i32_Set__i32.create(
    make_shared[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]](citem))
            inc(loc)

    def index(self, item):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem = deref(List__Map__i32_Map__i32_Set__i32(item)._vector.get())
        cdef vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]] vec = deref(self._vector.get())
        cdef vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]].iterator loc = std_libcpp.find(vec.begin(), vec.end(), citem)
        if loc != vec.end():
            return <int64_t> std_libcpp.distance(vec.begin(), loc)
        raise ValueError("{} is not in list".format(item))

    def count(self, item):
        cdef vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]] citem = deref(List__Map__i32_Map__i32_Set__i32(item)._vector.get())
        cdef vector[vector[cmap[int32_t,cmap[int32_t,cset[int32_t]]]]] vec = deref(self._vector.get())
        return <int64_t> std_libcpp.count(vec.begin(), vec.end(), citem)


Sequence.register(List__List__Map__i32_Map__i32_Set__i32)


