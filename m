Received: from fk-out-0910.google.com ([209.85.128.189]:45350 "EHLO
	fk-out-0910.google.com") by ftp.linux-mips.org with ESMTP
	id S21102800AbZAZWfr (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 26 Jan 2009 22:35:47 +0000
Received: by fk-out-0910.google.com with SMTP id 26so2928094fkx.0
        for <linux-mips@linux-mips.org>; Mon, 26 Jan 2009 14:35:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <FF038EB85946AA46B18DFEE6E6F8A28976828C@xmb-rtp-218.amer.cisco.com>
References: <FF038EB85946AA46B18DFEE6E6F8A28976825D@xmb-rtp-218.amer.cisco.com>
	 <497C3C6F.3000209@paralogos.com>
	 <FF038EB85946AA46B18DFEE6E6F8A28976828C@xmb-rtp-218.amer.cisco.com>
Date: Tue, 27 Jan 2009 00:35:45 +0200
Message-ID: <fce2a370901261435w3bf1bad7x9700cf5e9af4336b@mail.gmail.com>
Subject: Re: 2.6.28 will not boot on 24K processor, ebase incorrectly modified
	in set_uncached_handler
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-Path: <ihar.hrachyshka@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: "David VomLehn (dvomlehn)" <dvomlehn@cisco.com>
Cc: "Kevin D. Kissell" <kevink@paralogos.com>, linux-mips@linux-mips.org, "Dezhong Diao (dediao)" <dediao@cisco.com>, "Victor Williams Jr (williavi)" <williavi@cisco.com>, "Michael Sundius -X (msundius - Yoh Services LLC at Cisco)" <msundius@cisco.com>
Message-ID: <20090126223545.Mg7Lgn-ds1xO3kCK2JnoOMJAIfVZ8sQXJiYt4mbt7gE@z>

On Sun, Jan 25, 2009 at 11:50 PM, David VomLehn (dvomlehn)
<dvomlehn@cisco.com> wrote:
>> From: Kevin D. Kissell [mailto:kevink@paralogos.com]
>> Sent: Sunday, January 25, 2009 2:18 AM
>> To: David VomLehn (dvomlehn)
>> Cc: linux-mips@linux-mips.org; Dezhong Diao (dediao); Victor
>> Williams Jr (williavi); Michael Sundius -X (msundius - Yoh
>> Services LLC at Cisco)
>> Subject: Re: 2.6.28 will not boot on 24K processor, ebase
>> incorrectly modified in set_uncached_handler
>>
>> David VomLehn (dvomlehn) wrote:
>> > The 2.6.28 kernel dies in memcpy when called from
>> set_vi_srs_handler on
>> > a
>> > 24K processor. The problem is that ebase has an invalid value. The
>> > original
>> > value of ebase comes from a bootmem allocation, but the
>> following code
>> > in
>> > set_uncached_handler takes a perfectly good kseg0 address
>> and turns it
>> > into
>> > an invalid kseg1 address.
>> >
>> >     if (cpu_has_mips_r2)
>> >             ebase += (read_c0_ebase() & 0x3ffff000);
>> >
>> > This code was added in commit
>> 566f74f6b2f8b85d5b8d6caaf97e5672cecd3e3e.
>> >
>> I remember worrying about why it was "+=" and not "=" when others had
>> problems with that patch. See the thread "NXP STB225 board
>> support" from
>> January 8 or so.  When I asked about that, I got a comment
>> that the add
>> operation was correct, but that patch *should* have said
>> "uncached_ebase
>> += (read_c0_ebase() & 0x3ffff000);"  I guess uncache_ebase is
>> assumed to
>> contain something interesting in some non-address bits. Try
>> pre-pending
>> "uncached_" to that "ebase"...
>
> Just adding uncached_ to the ebase doesn't appear to work. Looking at
> the git
> log makes it a bit unclear as to exactly who made this change, but it
> would
> be helpful to know what was intended.
>
>

If the patch invoked broke lots of subarchs why should we have it in
the first place? Can't we just revert it until we have a fix for this
bug?
