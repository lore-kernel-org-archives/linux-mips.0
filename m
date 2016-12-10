Received: from mx.sealand.io ([193.160.39.68]:50117 "EHLO mx.sealand.io"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23993164AbcLJWbhNFchc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 10 Dec 2016 23:31:37 +0100
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <87vauvhwdu.fsf@alice.fifthhorseman.net>
Date: Sat, 10 Dec 2016 23:18:14 +0100
Content-Transfer-Encoding: 8BIT
Message-ID: <CE942916-BF45-44CC-A5F5-3838CF9C93BC@danrl.com>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <095cac5b-b757-6f4a-e699-8eedf9ed7221@stressinduktion.org>
 <87vauvhwdu.fsf@alice.fifthhorseman.net>
Return-Path: <mail@danrl.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Cc: Hannes Frederic Sowa <hannes@stressinduktion.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Netdev <netdev@vger.kernel.org>, linux-mips@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <20161210221814.7VIDMmdQXjcFUGaPuT27A911HVeCvjAtqjjOIydCRAQ@z>


> On 8 Dec 2016, at 05:34, Daniel Kahn Gillmor <dkg@fifthhorseman.net> wrote:
> 
> On Wed 2016-12-07 19:30:34 -0500, Hannes Frederic Sowa wrote:
>> Your custom protocol should be designed in a way you get an aligned ip
>> header. Most protocols of the IETF follow this mantra and it is always
>> possible to e.g. pad options so you end up on aligned boundaries for the
>> next header.
> 
> fwiw, i'm not convinced that "most protocols of the IETF follow this
> mantra".  we've had multiple discussions in different protocol groups
> about shaving or bloating by a few bytes here or there in different
> protocols, and i don't think anyone has brought up memory alignment as
> an argument in any of the discussions i've followed.
> 

If the trade-off is between 1 padding byte and 2 byte alignment versus 3 padding bytes and 4 byte alignment I would definitely opt for 3 padding bytes. I know how that waste feels like to a protocol designer, but I think it is worth it. Maybe the padding/reserved will be useful some day for an additional feature.

I remember alignment being discussed and taken very seriously in 6man a couple of times. Often, though, protocol designers did align without much discussion. Implementing unaligned protocols is a pain I've experienced first hand.
