Received: from mailapp01.imgtec.com ([195.59.15.196]:48836 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007622AbbB0TE4EfikO (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 27 Feb 2015 20:04:56 +0100
Message-ID: <54F0BFD0.2050901@imgtec.com>
Date: Fri, 27 Feb 2015 13:04:48 -0600
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH V7 1/3] MIPS: Rearrange PTE bits into fixed positions.
References: <1424996199-21366-1-git-send-email-Steven.Hill@imgtec.com> <1424996199-21366-2-git-send-email-Steven.Hill@imgtec.com> <54EFBF9D.4020004@gmail.com> <54EFE6B9.1050109@imgtec.com> <54F0AECF.5070501@gmail.com>
In-Reply-To: <54F0AECF.5070501@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20150227190448.nbUBLt7ggDFek0PJR0-ODA9Bml6XbqEYuEIIslkVDgE@z>

On 02/27/2015 11:52 AM, David Daney wrote:
> 
> I think there is still misunderstanding.
> 
> Your patches leave us with definitions for *both* _PAGE_READ *and* 
> _PAGE_NO_READ defined in the source code.  My suggestion was to 
> eliminate all vestiges of _PAGE_READ and _PAGE_READ_SHIFT, and unify
> all variants to use _PAGE_NO_READ
> 
Okay, I see what you are after. I think it is worth doing, but I would
really like to get XPA into 4.0 along with this patch as it is. I will
commit to doing a follow up patch for the above. Is that acceptable?
