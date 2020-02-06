Return-Path: <SRS0=UFWE=32=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0603DC33CAC
	for <linux-mips@archiver.kernel.org>; Thu,  6 Feb 2020 16:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D211221741
	for <linux-mips@archiver.kernel.org>; Thu,  6 Feb 2020 16:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GEBJzEn/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbgBFQO2 (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Thu, 6 Feb 2020 11:14:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22565 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727379AbgBFQO2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 11:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581005662;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zD2zZ3ak+8ZDNOjl3NQ0JmucKO3t2SwHGRlR5dLOuQs=;
        b=GEBJzEn/NXj2mtl3eq7OG/BXgl4FE+09ANBImrl6aFlUovYsjjMW13ukTEO258o4/46mXI
        6hg0THNbleruqsAaxAKyZhN2QQJbprxZc8Dr0ChSmx0med35u/6PMph+hmi6uDo9JgaxbD
        p/TfP70Wdu9A7zT8WQ/OvNOLral1pSk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-rmpTLbLKN0ewNlT_8QGlXg-1; Thu, 06 Feb 2020 11:14:21 -0500
X-MC-Unique: rmpTLbLKN0ewNlT_8QGlXg-1
Received: by mail-qk1-f198.google.com with SMTP id q2so3896426qkq.19
        for <linux-mips@vger.kernel.org>; Thu, 06 Feb 2020 08:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zD2zZ3ak+8ZDNOjl3NQ0JmucKO3t2SwHGRlR5dLOuQs=;
        b=YvYWACf5xGTgdA6TzzceqJgUpDcu0bb8ylD4ZDUcA6BoqRRC+E9ThYGid3usonc2h+
         z0nIidmR2bfb5JotnUUZsMe5eufVrpPL1KuruC37oSWgsesKDJoP8hWXt8ZPwH8PQhir
         XVieFWXxYkeNEhSG0vdJ8p5JW8VT5qVeVh3uxHr8/5Vi/snP8Vl7dG7cJEgvjhHCKVAi
         CiUW6KtbOqPPoWttpEuRzAEVf1ElZmK228lYXkp7aaeyDkmy7C7a2gmfwzkcz4ce3c2q
         xcHpHSSHSiRhYCbLdJZ8Q0ksmDKtNZvRnR7ZJfpwnjnpisfnA/IFVYGKzNaj6+k6hMzo
         F9WA==
X-Gm-Message-State: APjAAAXxt+xzlBxKevvE3sqtc7yoCtXiN3qzxK2bQIOCDHo1bZCzR16R
        l0T2vciMO3lx1qe4KFLErWCfEeZ+en+GXYbO3kzR5889j9vcJYNUGUCoSgdZtYT8QJWp+FJKF4L
        FddrRVA1bLnTCAsLDlhmZCg==
X-Received: by 2002:ac8:6f27:: with SMTP id i7mr3235326qtv.253.1581005660655;
        Thu, 06 Feb 2020 08:14:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqzCPmrX47EJacBvj/8AwtDA4K9i5Vm/4QY2t/yuwCUp2i98pBnWQFyP1cxUVQ9RQgxjF7p4Wg==
X-Received: by 2002:ac8:6f27:: with SMTP id i7mr3235285qtv.253.1581005660385;
        Thu, 06 Feb 2020 08:14:20 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
        by smtp.gmail.com with ESMTPSA id 136sm1590227qkn.109.2020.02.06.08.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 08:14:19 -0800 (PST)
Date:   Thu, 6 Feb 2020 11:14:15 -0500
From:   Peter Xu <peterx@redhat.com>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Paolo Bonzini <pbonzini@redhat.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
        Christoffer Dall <christoffer.dall@arm.com>,
        Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 12/19] KVM: Move memslot deletion to helper function
Message-ID: <20200206161415.GA695333@xz-x1>
References: <20200121223157.15263-1-sean.j.christopherson@intel.com>
 <20200121223157.15263-13-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200121223157.15263-13-sean.j.christopherson@intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 21, 2020 at 02:31:50PM -0800, Sean Christopherson wrote:
> Move memslot deletion into its own routine so that the success path for
> other memslot updates does not need to use kvm_free_memslot(), i.e. can
> explicitly destroy the dirty bitmap when necessary.  This paves the way
> for dropping @dont from kvm_free_memslot(), i.e. all callers now pass
> NULL for @dont.
> 
> Add a comment above the code to make a copy of the existing memslot
> prior to deletion, it is not at all obvious that the pointer will become
> stale during sorting and/or installation of new memslots.

Could you help explain a bit on this explicit comment?  I can follow
up with the patch itself which looks all correct to me, but I failed
to catch what this extra comment wants to emphasize...

Thanks,

> 
> Note, kvm_arch_commit_memory_region() allows an architecture to free
> resources when moving a memslot or changing its flags, e.g. x86 frees
> its arch specific memslot metadata during commit_memory_region().

-- 
Peter Xu

