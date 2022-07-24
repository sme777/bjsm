module Strategy
    BASIC = {
        hard: {
            "20-2": :stand,
            "20-3": :stand,
            "20-4": :stand,
            "20-5": :stand,
            "20-6": :stand,
            "20-7": :stand,
            "20-8": :stand,
            "20-9": :stand,
            "20-T": :stand,
            "20-A": :stand,

            "19-2": :stand,
            "19-3": :stand,
            "19-4": :stand,
            "19-5": :stand,
            "19-6": :stand,
            "19-7": :stand,
            "19-8": :stand,
            "19-9": :stand,
            "19-T": :stand,
            "19-A": :stand,

            "18-2": :stand,
            "18-3": :stand,
            "18-4": :stand,
            "18-5": :stand,
            "18-6": :stand,
            "18-7": :stand,
            "18-8": :stand,
            "18-9": :stand,
            "18-T": :stand,
            "18-A": :stand,

            "17-2": :stand,
            "17-3": :stand,
            "17-4": :stand,
            "17-5": :stand,
            "17-6": :stand,
            "17-7": :stand,
            "17-8": :stand,
            "17-9": :stand,
            "17-T": :stand,
            "17-A": :stand,

            "16-2": :stand,
            "16-3": :stand,
            "16-4": :stand,
            "16-5": :stand,
            "16-6": :stand,
            "16-7": :hit,
            "16-8": :hit,
            "16-9": :hit,
            "16-T": :hit,
            "16-A": :hit,
            
            "15-2": :stand,
            "15-3": :stand,
            "15-4": :stand,
            "15-5": :stand,
            "15-6": :stand,
            "15-7": :hit,
            "15-8": :hit,
            "15-9": :hit,
            "15-T": :hit,
            "15-A": :hit,

            "14-2": :stand,
            "14-3": :stand,
            "14-4": :stand,
            "14-5": :stand,
            "14-6": :stand,
            "14-7": :hit,
            "14-8": :hit,
            "14-9": :hit,
            "14-T": :hit,
            "14-A": :hit,

            "13-2": :stand,
            "13-3": :stand,
            "13-4": :stand,
            "13-5": :stand,
            "13-6": :stand,
            "13-7": :hit,
            "13-8": :hit,
            "13-9": :hit,
            "13-T": :hit,
            "13-A": :hit,

            "12-2": :hit,
            "12-3": :hit,
            "12-4": :stand,
            "12-5": :stand,
            "12-6": :stand,
            "12-7": :hit,
            "12-8": :hit,
            "12-9": :hit,
            "12-T": :hit,
            "12-A": :hit,
            
            "11-2": :double,
            "11-3": :double,
            "11-4": :double,
            "11-5": :double,
            "11-6": :double,
            "11-7": :double,
            "11-8": :double,
            "11-9": :double,
            "11-T": :double,
            "11-A": :double,

            "10-2": :double,
            "10-3": :double,
            "10-4": :double,
            "10-5": :double,
            "10-6": :double,
            "10-7": :double,
            "10-8": :double,
            "10-9": :double,
            "10-T": :hit,
            "10-A": :hit,

            "9-2": :hit,
            "9-3": :double,
            "9-4": :double,
            "9-5": :double,
            "9-6": :double,
            "9-7": :hit,
            "9-8": :hit,
            "9-9": :hit,
            "9-T": :hit,
            "9-A": :hit,

            "8-2": :hit,
            "8-3": :hit,
            "8-4": :hit,
            "8-5": :hit,
            "8-6": :hit,
            "8-7": :hit,
            "8-8": :hit,
            "8-9": :hit,
            "8-T": :hit,
            "8-A": :hit,
        },

        soft: {
            "A9-2": :stand,
            "A9-3": :stand,
            "A9-4": :stand,
            "A9-5": :stand,
            "A9-6": :stand,
            "A9-7": :stand,
            "A9-8": :stand,
            "A9-9": :stand,
            "A9-T": :stand,
            "A9-A": :stand,
            
            "A8-2": :stand,
            "A8-3": :stand,
            "A8-4": :stand,
            "A8-5": :stand,
            "A8-6": :double,
            "A8-7": :stand,
            "A8-8": :stand,
            "A8-9": :stand,
            "A8-T": :stand,
            "A8-A": :stand,

            "A7-2": :double,
            "A7-3": :double,
            "A7-4": :double,
            "A7-5": :double,
            "A7-6": :double,
            "A7-7": :stand,
            "A7-8": :stand,
            "A7-9": :hit,
            "A7-T": :hit,
            "A7-A": :hit,
            
            "A6-2": :hit,
            "A6-3": :double,
            "A6-4": :double,
            "A6-5": :double,
            "A6-6": :double,
            "A6-7": :hit,
            "A6-8": :hit,
            "A6-9": :hit,
            "A6-T": :hit,
            "A6-A": :hit,

            "A5-2": :hit,
            "A5-3": :hit,
            "A5-4": :double,
            "A5-5": :double,
            "A5-6": :double,
            "A5-7": :hit,
            "A5-8": :hit,
            "A5-9": :hit,
            "A5-T": :hit,
            "A5-A": :hit,

            "A4-2": :hit,
            "A4-3": :hit,
            "A4-4": :double,
            "A4-5": :double,
            "A4-6": :double,
            "A4-7": :hit,
            "A4-8": :hit,
            "A4-9": :hit,
            "A4-T": :hit,
            "A4-A": :hit,

            "A3-2": :hit,
            "A3-3": :hit,
            "A3-4": :hit,
            "A3-5": :double,
            "A3-6": :double,
            "A3-7": :hit,
            "A3-8": :hit,
            "A3-9": :hit,
            "A3-T": :hit,
            "A3-A": :hit,

            "A2-2": :hit,
            "A2-3": :hit,
            "A2-4": :hit,
            "A2-5": :double,
            "A2-6": :double,
            "A2-7": :hit,
            "A2-8": :hit,
            "A2-9": :hit,
            "A2-T": :hit,
            "A2-A": :hit,
        },

        split: {
            "A-2": true,
            "A-3": true,
            "A-4": true,
            "A-5": true,
            "A-6": true,
            "A-7": true,
            "A-8": true,
            "A-9": true,
            "A-T": true,
            "A-A": true,
            
            "T-2": false,
            "T-3": false,
            "T-4": false,
            "T-5": false,
            "T-6": false,
            "T-7": false,
            "T-8": false,
            "T-9": false,
            "T-T": false,
            "T-A": false,
            
            "9-2": true,
            "9-3": true,
            "9-4": true,
            "9-5": true,
            "9-6": true,
            "9-7": false,
            "9-8": true,
            "9-9": true,
            "9-T": false,
            "9-A": false,
            
            "8-2": true,
            "8-3": true,
            "8-4": true,
            "8-5": true,
            "8-6": true,
            "8-7": true,
            "8-8": true,
            "8-9": true,
            "8-T": true,
            "8-A": true,

            "7-2": true,
            "7-3": true,
            "7-4": true,
            "7-5": true,
            "7-6": true,
            "7-7": true,
            "7-8": false,
            "7-9": false,
            "7-T": false,
            "7-A": false,
            
            "6-2": true,
            "6-3": true,
            "6-4": true,
            "6-5": true,
            "6-6": true,
            "6-7": false,
            "6-8": false,
            "6-9": false,
            "6-T": false,
            "6-A": false,

            "5-2": false,
            "5-3": false,
            "5-4": false,
            "5-5": false,
            "5-6": false,
            "5-7": false,
            "5-8": false,
            "5-9": false,
            "5-T": false,
            "5-A": false,
        
            "4-2": false,
            "4-3": false,
            "4-4": false,
            "4-5": true,
            "4-6": true,
            "4-7": false,
            "4-8": false,
            "4-9": false,
            "4-T": false,
            "4-A": false,

            "3-2": true,
            "3-3": true,
            "3-4": true,
            "3-5": true,
            "3-6": true,
            "3-7": true,
            "3-8": false,
            "3-9": false,
            "3-T": false,
            "3-A": false,
            
            "2-2": true,
            "2-3": true,
            "2-4": true,
            "2-5": true,
            "2-6": true,
            "2-7": true,
            "2-8": false,
            "2-9": false,
            "2-T": false,
            "2-A": false,
        }
    }
end