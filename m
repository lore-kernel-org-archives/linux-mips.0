Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: Mike Shaver <shaver@neon.ingenia.ca>
Message-ID: <199705112256.SAA11805@neon.ingenia.ca>
Subject: irix_times
Date: Sun, 11 May 1997 18:56:35 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: linux@cthulhu.engr.sgi.com
Message-ID: <19970511225635.uLqhzsottryAva7N7z-QnMj2zJKaRvMQAjC5ychXP9w@z>

From sysirix.c:

asmlinkage int irix_times(struct tms * tbuf)
{
        int error;
        lock_kernel();
        if (tbuf) {
                int error = verify_area(VERIFY_WRITE,tbuf,sizeof
*tbuf);
                if (error)
                        goto out;
                __put_user(current->utime,&tbuf->tms_utime);
                __put_user(current->stime,&tbuf->tms_stime);
                __put_user(current->cutime,&tbuf->tms_cutime);
                __put_user(current->cstime,&tbuf->tms_cstime);
        }
        error = 0;

out:
        unlock_kernel();
        return error;
}

gcc tells me, quite rightly, that error may be used without
initialization, and I'm wondering if the hiding of error in the C<if
(tbuf)> block is intentional.

I assume not, but I thought I'd make sure it just wasn't davem
outsmarting me again. =)

Mike

-- 
#> Mike Shaver (shaver@ingenia.com) Ingenia Communications Corporation 
#>                   Welcome to the technocracy.
#>                                                                     
#> "you'd be so disappointed
#>              to find out that the magic was not
#>                          really meant for you" - OLP
