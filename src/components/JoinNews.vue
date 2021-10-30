<template>
    <div class="join-letter">
            <h3>Join News Lettes</h3>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nostrum numquam rem sed veniam, pariatur eaque illo magni sint, impedit aspernatur voluptatem beatae architecto inventore iure maxime cumque explicabo fugit distinctio.</p>
            <div class="form-join">
                    <input type="text" class="form-control" placeholder="Enter your email...">
                    <button class="btn btn-danger">Subscribe</button>
            </div>
        </div>
</template>
<script>
export default {
    
}
</script>
<style lang="scss" scoped>
    .join-letter{
        padding: 50px 150px;
        text-align: center;
        background: linear-gradient(to right, wheat, white);
        .form-join{
                display: inline-flex;
                width: 60%;
                flex-wrap: nowrap;
            input{
                margin-right: 10px;
            }
        }
    }
</style>