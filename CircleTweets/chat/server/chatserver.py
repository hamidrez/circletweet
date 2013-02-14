# By Hamid Dadkhah
# 2013-February-09
# chatserver.py for circleTweets


from twisted.internet.protocol import Protocol, Factory
from twisted.internet import reactor
import random

#senderUUID:239847873274328,receiverUUID:9843789759349857,msg:"Hey Sexy!"
#iam:239847873274328

class IphoneChat(Protocol):
    fruits = ["Apple", "Orange", "Mango", "Banana", "Cucumber", "Watermelon", "Tomato"]
    def connectionMade(self):
        self.transport.write("""connected""")
        self.factory.clients.append(self)
        print "clients are ", self.factory.clients
	
	def connectionLost(self, reason):
	    self.factory.clients.remove(self)
	
    def message(self, message):
        self.transport.write(message + '\n')
    
    def dataReceived(self, data):
        print "data is ", data
        temp = data.split(',')
        msg = ''
        if len(temp) == 1:
            #verify and store the user info and assign a fruit to it
            senderInfo = temp[0].split(':')
            senderIdentifier = senderInfo[0]

            if senderIdentifier == 'iam':
                    senderUUID = senderInfo[1]
                    print senderInfo[1]

        if len(temp) == 3:
            #verify and store the sender info
            senderInfo = temp[0].split(':')
            senderIdentifier = senderInfo[0]
            if senderIdentifier == 'senderUUID':
                print "Passed the sender UUID Test\n"
                senderUUID = senderInfo[1]
    
            print temp
            #verify and store the receiver info
            receiverInfo = temp[1].split(':')
            receiverIdentifier = receiverInfo[0]
            if receiverIdentifier == 'receiverUUID':
                print "Passed the receiver UUID Test\n"
                receiverUUID = senderInfo[1]
        
            #verify and store the message
            messageInfo = temp[2].split(':')
            messageIdentifier = messageInfo[0]
            if messageIdentifier == 'msg':
                message = messageInfo[1]
                listRandomIndex = random.randrange(1000, 10000, 1);
                listRandomIndex = listRandomIndex%(len(self.fruits))
                randomName = self.fruits[listRandomIndex]
                msg = randomName + " has joined"
            
            for c in self.factory.clients:
                c.message(msg)
            
factory = Factory()
factory.protocol = IphoneChat
factory.clients = []

reactor.listenTCP(96, factory)
print "Iphone Chat server started"
reactor.run()

