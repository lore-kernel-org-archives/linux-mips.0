Received: from unicorn.mansr.com ([81.2.72.234]:49228 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993006AbcLLQbzELFOa convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 12 Dec 2016 17:31:55 +0100
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
        <CAA93jw7hcmkcyD=t4VRrQFfHk+n+EkSVgY6KFDq0_-DGpMADYw@mail.gmail.com>
        <20161207.135127.789629809982860453.davem@davemloft.net>
        <CAHmME9oLgjDA2F0gkFzHU2Es8-XCxQHRABS18OKF0EnZgt1=LQ@mail.gmail.com>
        <040bcdb2-2725-c8de-11d9-a4f77b75d9d8@nbd.name>
        <yw1x37hvykzk.fsf@unicorn.mansr.com>
        <063D6719AE5E284EB5DD2968C1650D6DB023BF78@AcuExch.aculab.com>
Date: Mon, 12 Dec 2016 16:31:47 +0000
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DB023BF78@AcuExch.aculab.com>
        (David Laight's message of "Mon, 12 Dec 2016 16:19:17 +0000")
Message-ID: <yw1xd1gxw1l8.fsf@unicorn.mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-Path: <mans@mansr.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Laight <David.Laight@ACULAB.COM>
Cc: Felix Fietkau <nbd@nbd.name>, "Jason A. Donenfeld" <Jason@zx2c4.com>, David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>, WireGuard mailing list <wireguard@lists.zx2c4.com>, LKML <linux-kernel@vger.kernel.org>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20161212163147.WWyxwCYWJvyB4vMFwSbIxiBjICmnkuANe2id0VES9yg@z>

David Laight <David.Laight@ACULAB.COM> writes:

> From: Måns Rullgård
>> Sent: 10 December 2016 13:25
> ...
>> I solved this problem in an Ethernet driver by copying the initial part
>> of the packet to an aligned skb and appending the remainder using
>> skb_add_rx_frag().  The kernel network stack only cares about the
>> headers, so the alignment of the packet payload doesn't matter.
>
> That rather depends on where the packet payload ends up.
> It is likely that it will be copied to userspace (or maybe
> into some aligned kernel buffer).
> In which case you get an expensive misaligned copy.

There's not much to be done about that.  The only other option is to
bypass DMA entirely, and that's sure to be even worse.

> What do the hardware engineers think the ethernet interface will
> be used for!

Ticking boxes in marketing material.

-- 
Måns Rullgård
