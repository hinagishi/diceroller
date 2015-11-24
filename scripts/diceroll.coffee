module.exports = (robot) ->
    robot.hear /(\d+)d(\d+)\+?(\d)?/i, (msg) ->
        count = msg.match[1]
        base = msg.match[2]

        num = []
        sum = 0
        for i in [0..count-1]
            num[i] = Math.floor(Math.random() * base + 1)
            sum += num[i]

        if msg.match[3] != undefined
            sum += parseInt(msg.match[3], 10)

        msg.send "[#{num}] = #{sum}"

