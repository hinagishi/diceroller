module.exports = (robot) ->
    robot.hear /(\d+)d(\d+)\+?(\d)?/i, (msg) ->
        count = parseInt(msg.match[1])
        base = parseInt(msg.match[2])

        num = []
        sum = 0
        for i in [0..count-1]
            num[i] = Math.floor(Math.random() * base + 1)
            sum += num[i]

        if msg.match[3] != undefined
            num[count] = parseInt(msg.match[3], 10)
            sum += num[count]

        pos = msg.match.index - 1
        type = msg.message.text[0..pos]
        if pos < 0
            type = ""
        msg.send "#{msg.message.user.name} #{type} [#{num}] = #{sum}"

