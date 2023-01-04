module 0x42::ID {
    use std::debug;
    use std::vector;
    
    struct Ids has drop, key, store, copy {
        uniqueID: vector<UniqueIdS>
    }

    struct UniqueIdS has drop, key, store, copy {
        name: vector<u8>,
        idValue: u8
    }

    public fun assignFun(uniqueDetails1: vector<u8>, uniqueDetails2: u8, _idDetails:&mut Ids):UniqueIdS {
        let setOfIds = UniqueIdS {
            name: uniqueDetails1,
            idValue: uniqueDetails2 + 1
        };
        addId(setOfIds,_idDetails);
        return setOfIds
    }

    fun addId(_uniqueDeatails: UniqueIdS, iDetails:&mut Ids) {
        vector::push_back(&mut iDetails.uniqueID, _uniqueDeatails);
    }

    #[test]

    fun testId() {
        let id1 = UniqueIdS {
            name: b"Ayo",
            idValue: 1
        };
        let id2 = Ids {
            uniqueID: (vector[id1])
        };
        let createID = assignFun(id1.name, id1.idValue, &mut id2);
        assert!(createID.name == id1.name, 0);
        debug::print(&createID.idValue);
    }
}