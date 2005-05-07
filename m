From: "Bogdan Vacaliuc" <bvacaliuc@ngit.com>
Subject: RE: dbau1200 ethernet driver?
Date: Sat, 7 May 2005 09:08:36 -0400
Message-ID: <00c801c55305$e3de3660$0b03a8c0@lithium>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <1115394400.5785.3.camel@localhost.localdomain>
Return-Path: <bvacaliuc@ngit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ppopov@embeddedalley.com, "'Ruslan V.Pisarev'" <jerry@izmiran.rssi.ru>
Cc: linux-mips@linux-mips.org
Message-ID: <20050507130836.YW9qjveaJPfXiVzY2vDoeWjx1M8b2JeN1x9yU6U0JIw@z>

On Friday, May 06, 2005 11:47 AM, Pete Popov wrote:

> On Fri, 2005-05-06 at 15:53 +0300, Ruslan V.Pisarev wrote:
>>   Hi!
>> 
>>  I compiled last 2.6 kernel (2-3 weeks ago from cvs@linux-mips) and
>> trying to start it on DBAu1200 development board. First problem I
>> discovered with "nfsroot" configuration - is that kernel cannot find
>> network interface at boot-time.  There is a smc91c111 network chip on
>> board, so my question is - what driver is suitable with him?
> 
> The smc91x.c driver. However, I don't remember if that driver was
> tested.  The board was tested with a different smc driver which I
> couldn't push in the tree because it was old and would conflict with
> the smc91x.c.   
> 
>>  Is it "MIPS AU1000 Ethernet support"
>> which fails to compile with "error: `NUM_ETH_INTERFACES' undeclared"
>> (and it must be?) or something different? It seems that I have
>> enabled all other options for ethernet functionality.
> 
> Well, that's a different driver.

Yes, and not for Au1200.  The Au1200 does not have an integrated MAC; access to the MAC/PHY is through the static memory controller.

-bogdan
