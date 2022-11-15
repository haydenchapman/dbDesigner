CREATE TABLE "public.Users" (
	"user_id" serial NOT NULL,
	"username" serial NOT NULL,
	"email" varchar(50) NOT NULL,
	"password" TEXT(50) NOT NULL,
	CONSTRAINT "Users_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.Recipes" (
	"recipes_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"instructions" TEXT NOT NULL,
	"share_status" BOOLEAN NOT NULL,
	"occasions_id" integer NOT NULL,
	CONSTRAINT "Recipes_pk" PRIMARY KEY ("recipes_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "public.GroceryList" (
	"grocery_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	"ingredient_id" integer NOT NULL,
	"item" varchar(50) NOT NULL,
	"quant" integer(50) NOT NULL,
	CONSTRAINT "GroceryList_pk" PRIMARY KEY ("grocery_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients" (
	"ingredient_id" serial NOT NULL,
	"recipe_id" integer NOT NULL,
	"ingredient" varchar(50) NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredient_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occasions" (
	"occasions_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"occasion_name" varchar(50) NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Occasions_pk" PRIMARY KEY ("occasions_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.occasion_recipe" (
	"occasion_recipe_id" serial NOT NULL,
	"recipes_id" integer NOT NULL,
	"occasions_id" integer NOT NULL,
	CONSTRAINT "occasion_recipe_pk" PRIMARY KEY ("occasion_recipe_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "Recipes" ADD CONSTRAINT "Recipes_fk1" FOREIGN KEY ("occasions_id") REFERENCES "Occasions"("occasions_id");

ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");
ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipes_id");
ALTER TABLE "GroceryList" ADD CONSTRAINT "GroceryList_fk2" FOREIGN KEY ("ingredient_id") REFERENCES "Ingredients"("ingredient_id");

ALTER TABLE "Ingredients" ADD CONSTRAINT "Ingredients_fk0" FOREIGN KEY ("recipe_id") REFERENCES "Recipes"("recipes_id");

ALTER TABLE "Occasions" ADD CONSTRAINT "Occasions_fk0" FOREIGN KEY ("user_id") REFERENCES "Users"("user_id");

ALTER TABLE "occasion_recipe" ADD CONSTRAINT "occasion_recipe_fk0" FOREIGN KEY ("recipes_id") REFERENCES "Recipes"("recipes_id");
ALTER TABLE "occasion_recipe" ADD CONSTRAINT "occasion_recipe_fk1" FOREIGN KEY ("occasions_id") REFERENCES "Occasions"("occasions_id");







